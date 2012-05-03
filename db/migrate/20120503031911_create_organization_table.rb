class CreateOrganizationTable < ActiveRecord::Migration
  def up
  	create_table(:organizations) do |t|
  	t.float :latitude
  	t.float :longitude
    t.text :description
    end
  end

  def down
  drop_table(:organizations)
  end
end
