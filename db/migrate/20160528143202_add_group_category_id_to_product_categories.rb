class AddGroupCategoryIdToProductCategories < ActiveRecord::Migration
  def change
    add_column :product_categories, :group_category_id, :integer
  end
end
