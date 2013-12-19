class AddUserFields < ActiveRecord::Migration
  def change
  	add_column :users, :looking_for, :text
  	add_column :users, :personal_url, :string
  end
end
