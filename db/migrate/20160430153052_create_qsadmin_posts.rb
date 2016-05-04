class CreateQsadminPosts < ActiveRecord::Migration
  def change
    create_table :qsadmin_posts do |t|

      t.timestamps null: false
    end
  end
end
