class AddScreenNameToUsersTable < ActiveRecord::Migration
  def up
    add_column :users, :screen_name, :string
  end
  
  def down
    remove_column :users, :screen_name
  end
end
