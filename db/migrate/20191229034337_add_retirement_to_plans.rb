class AddRetirementToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :retirement, :integer
  end
end
