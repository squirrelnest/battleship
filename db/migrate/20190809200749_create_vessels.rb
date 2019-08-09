class CreateVessels < ActiveRecord::Migration[5.2]
  def change
    create_table :vessels do |t|
      t.string :name
      t.integer :size
      t.integer :player_id
      t.string :vessel_type
      t.timestamps
    end
  end
end
