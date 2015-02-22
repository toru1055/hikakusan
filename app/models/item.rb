class Item < ActiveRecord::Base
  belongs_to :table
  has_many :item_columns, :dependent => :destroy
end
