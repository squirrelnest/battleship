class RemoveSizeFromVessel < ActiveRecord::Migration[5.2]
  def change
    remove_column :vessels, :size
  end
end
