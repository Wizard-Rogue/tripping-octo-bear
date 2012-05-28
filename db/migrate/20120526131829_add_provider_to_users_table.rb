class AddProviderToUsersTable < ActiveRecord::Migration
  def up
  	add_column :users, :provider, :boolean
  end

  def down
  	remove_column :users, :provider
  end
end
