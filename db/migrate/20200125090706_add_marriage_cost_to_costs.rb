class AddMarriageCostToCosts < ActiveRecord::Migration[5.2]
  def change
    add_column :costs, :marriage_cost, :integer
    add_column :costs, :myhome_cost,   :integer
  end
end
