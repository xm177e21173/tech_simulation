class CreateCals < ActiveRecord::Migration[5.2]
  def change
    create_table :cals do |t|
      t.integer :user_id
      t.integer :g1
      t.integer :g2
      t.integer :g3
      t.integer :g4
      t.integer :g5
      t.integer :g6
      t.integer :g7
      t.integer :g8
      t.integer :g9
      t.integer :g10
      t.integer :t1
      t.integer :t2
      t.integer :t3
      t.integer :t4
      t.integer :t5
      t.integer :t6
      t.integer :t7
      t.integer :t8
      t.integer :t9
      t.integer :t10
      t.timestamps
    end
  end
end
