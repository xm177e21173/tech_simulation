class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string  :marriage
      t.integer :sons
      t.integer :birth
      t.timestamps
    end
  end
end
