class AddKeyColumnNameToTables < ActiveRecord::Migration
  def change
    add_column :tables, :key_column_name, :string
  end
end
