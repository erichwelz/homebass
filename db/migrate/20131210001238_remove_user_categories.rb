class RemoveUserCategories < ActiveRecord::Migration
  def change
    remove_column :users, :categories
  end
end
