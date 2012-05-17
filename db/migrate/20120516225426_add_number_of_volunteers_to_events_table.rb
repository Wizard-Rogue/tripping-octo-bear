class AddNumberOfVolunteersToEventsTable < ActiveRecord::Migration
  def up
    add_column :events, :number_of_volunteers, :integer
  end
  def down
    remove_column :events, :number_of_volunteers
  end
end
