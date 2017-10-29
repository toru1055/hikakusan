class CreateItemColumns < ActiveRecord::Migration[5.1]
  def change
    create_table :item_columns do |t|
      t.integer :table_id
      t.integer :item_id
      t.integer :column_id
      t.string :value

      t.timestamps
    end
  end
end
