class AddKeyColumnNameToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :tables, :key_column_name, :string
  end
end
