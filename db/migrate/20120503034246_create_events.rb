class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :organization_id
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.string :supporters
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
