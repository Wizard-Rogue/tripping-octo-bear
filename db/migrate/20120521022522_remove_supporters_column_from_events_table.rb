class RemoveSupportersColumnFromEventsTable < ActiveRecord::Migration
  def up
  	remove_column :events, :supporters
  end

  def down
  	add_column :events, :supporters, :string
  end
end
