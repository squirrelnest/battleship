class CreateVesselLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :vessel_locations do |t|
      t.integer :x
      t.string :y
      t.integer :vessel_id
      t.timestamps
    end
  end
end
