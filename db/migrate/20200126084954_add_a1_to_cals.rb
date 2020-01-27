class AddA1ToCals < ActiveRecord::Migration[5.2]
  def change
    add_column :cals, :a1, :integer
    add_column :cals, :a2, :integer
    add_column :cals, :a3, :integer
    add_column :cals, :a4, :integer
    add_column :cals, :a5, :integer
    add_column :cals, :a6, :integer
    add_column :cals, :a7, :integer
    add_column :cals, :a8, :integer
    add_column :cals, :a9, :integer
    add_column :cals, :a10, :integer
  end
end
