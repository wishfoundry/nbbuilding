require 'fileutils'

module Guard
  class RailsRunner
    MAX_WAIT_COUNT = 10

    attr_reader :options

    def initialize(options)
      @options = options
      @root = options[:root] ? File.expand_path(options[:root]) : Dir.pwd
    end

    def start
      kill_unmanaged_pid! if options[:force_run]
      run_rails_command!
      wait_for_pid
    end

    def stop
      if has_pid?
        pid = File.read(pid_file).strip.to_i
        sig_sent = kill_process("INT", pid)
        wait_for_no_pid if sig_sent

        # If you lost your pid_file, you are already died.
        kill_process("KILL", pid)
        remove_pid_file_and_wait_for_no_pid
      end
    end

    def restart
      stop
      start
    end

    def build_command
      command = build_cli_command if options[:CLI]
      command ||= build_zeus_command if options[:zeus]
      command ||= build_rails_command
      "sh -c 'cd \"#{@root}\" && #{command} &'"
    end

    def environment
      rails_env = if options[:zeus]
                    nil
                  else
                    options[:environment]
                  end

      { "RAILS_ENV" => rails_env }
    end

    def pid_file
      File.expand_path(options[:pid_file] || File.join(@root, "tmp/pids/#{options[:environment]}.pid"))
    end

    def pid
      has_pid? ? File.read(pid_file).to_i : nil
    end

    def sleep_time
      options[:timeout].to_f / MAX_WAIT_COUNT.to_f
    end

    private

    # command builders
    def build_options
      rails_options = [
        options[:daemon] ? '-d' : nil,
        options[:debugger] ? '-u' : nil,
        '-e', options[:environment],
        '--pid', "\"#{pid_file}\"",
        '-p', options[:port],
        options[:server],
      ]

      rails_options.join(' ')
    end

    def build_cli_command
      "#{options[:CLI]} --pid \"#{pid_file}\""
    end

    def build_zeus_command
      zeus_options = [
        options[:zeus_plan] || 'server',
      ]

      "zeus #{zeus_options.join(' ')} #{build_options}"
    end

    def build_rails_command
      "rails server #{build_options}"
    end

    def run_rails_command!
      system(environment, build_command)
    end

    def has_pid?
      File.file?(pid_file)
    end

    def wait_for_pid_action
      sleep sleep_time
    end

    def kill_unmanaged_pid!
      if pid = unmanaged_pid
        kill_process("KILL", pid)
        remove_pid_file_and_wait_for_no_pid
      end
    end

    def unmanaged_pid
      file_list = `lsof -n -i TCP:#{options[:port]}`
      file_list.each_line { |line|
        if line["*:#{options[:port]} "]
          return line.split("\s")[1]
        end
      }
      nil
    end

    private

    def wait_for_pid
      wait_for_pid_loop { has_pid? }
    end

    def wait_for_no_pid
      wait_for_pid_loop { !has_pid? }
    end

    def remove_pid_file_and_wait_for_no_pid
      wait_for_pid_loop do
        FileUtils.rm pid_file, :force => true
        !has_pid?
      end
    end

    def wait_for_pid_loop
      count = 0
      while !yield && count < MAX_WAIT_COUNT
        wait_for_pid_action
        count += 1
      end
      !(count == MAX_WAIT_COUNT)
    end

    def kill_process(signal, pid)
      begin
        Process.kill(signal, pid)
        true
      rescue Errno::EINVAL, Errno::ESRCH, RangeError
        false
      end
    end
  end
end
