class CreateCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :costs do |t|
      t.integer :user_id
      t.integer :edu_cost
      t.integer :old_cost
      t.integer :target
      t.integer :others
      t.timestamps
    end
  end
end
