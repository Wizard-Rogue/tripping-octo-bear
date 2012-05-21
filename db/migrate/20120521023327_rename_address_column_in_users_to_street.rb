class RenameAddressColumnInUsersToStreet < ActiveRecord::Migration
  def up
  	rename_column :users, :address, :street
  end

  def down
  	rename_column :users, :street, :address
  end
end