class AddSavingToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :saving, :integer
  end
end
