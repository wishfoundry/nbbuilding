class DragonflyGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def create_initializer
    template "initializer.rb.erb", "config/initializers/dragonfly.rb"
  end

  private

  def generate_secret
    SecureRandom.hex(32)
  end

  if RUBY_VERSION > "1.9"
    def hash_key(key)
      "#{key}:"
    end
  else
    def hash_key(key)
      ":#{key} =>"
    end
  end
end

