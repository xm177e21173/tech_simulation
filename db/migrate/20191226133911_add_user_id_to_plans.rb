class AddUserIdToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :user_id, :int
  end
end
