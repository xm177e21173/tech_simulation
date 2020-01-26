class AddGraphsToCal < ActiveRecord::Migration[5.2]
  def change
    add_column :cals, :graphs, :integer
    add_column :cals, :totals, :integer
    add_column :cals, :averages, :integer
  end
end
