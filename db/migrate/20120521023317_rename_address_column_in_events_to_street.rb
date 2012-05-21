class RenameAddressColumnInEventsToStreet < ActiveRecord::Migration
  def up
  	rename_column :events, :address, :street
  end

  def down
  	rename_column :events, :street, :address
  end
end