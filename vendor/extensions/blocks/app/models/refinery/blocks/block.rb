module Refinery
  module Blocks
    class Block < Refinery::Core::BaseModel
      self.table_name = 'refinery_blocks'


      validates :title, :presence => true, :uniqueness => true
    end
  end
end
