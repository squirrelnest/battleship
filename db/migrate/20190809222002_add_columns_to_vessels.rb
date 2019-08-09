class AddColumnsToVessels < ActiveRecord::Migration[5.2]
  def change
    add_column :vessels, :damage, :integer, :default => 0
    add_column :vessels, :status, :string, :default => "ALIVE"
  end
end
