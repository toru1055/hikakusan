class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.integer :table_id
      t.string :name
      t.integer :type_id
      t.boolean :not_null
      t.boolean :unique
      t.string :unit
      t.string :default_value

      t.timestamps
    end
  end
end
