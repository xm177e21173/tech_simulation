class AddSeveranceToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :severance,     :integer
    add_column :plans, :when_marriage, :integer
    add_column :plans, :wedding,       :string
    add_column :plans, :first_son,     :integer
    add_column :plans, :last_son,      :integer
    add_column :plans, :myhome,        :string
    add_column :plans, :when_myhome,   :integer
  end
end
