class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
    	t.text :detail
    	t.float :price
    	t.integer :quantum
    	t.text :note
    	t.integer :view

      t.timestamps null: false
    end
  end
end
