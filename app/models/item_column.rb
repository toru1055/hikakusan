class ItemColumn < ActiveRecord::Base
  belongs_to :table
  belongs_to :column
  belongs_to :item
end
