module Refinery
  module Blocks
    module Admin
      class BlocksController < ::Refinery::AdminController

        crudify :'refinery/blocks/block',
                :xhr_paging => true

        private

        def block_params
          #params.require(:brick).permit(:name, :html)
          params.require(:block).permit!
        end

      end
    end
  end
end
