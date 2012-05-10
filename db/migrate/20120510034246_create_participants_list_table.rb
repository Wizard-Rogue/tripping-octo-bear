class CreateParticipantsListTable < ActiveRecord::Migration
  def up
  	create_table :participants do |t|
  		t.references :event
		end
  end

  def down
  	drop_table :participants
  end
end
