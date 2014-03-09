module Refinery
  module Blocks
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Blocks

      engine_name :refinery_blocks

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "blocks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.blocks_admin_blocks_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/blocks/block'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Blocks)
      end
    end
  end
end
