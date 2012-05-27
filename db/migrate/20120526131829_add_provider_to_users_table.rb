class AddProviderToUsersTable < ActiveRecord::Migration
  def up
  	add_column :users, :provider, :boolean
  end

  def end
  	remove_column :users, :provider
  end
end
