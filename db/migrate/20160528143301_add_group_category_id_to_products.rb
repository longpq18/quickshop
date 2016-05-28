class AddGroupCategoryIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :group_category_id, :integer
  end
end
