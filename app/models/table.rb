class Table < ActiveRecord::Base
  has_many :columns, :dependent => :destroy
  has_many :items, :dependent => :destroy
  has_many :item_columns, :dependent => :destroy

  # Class method
  
  # Instance method
end
