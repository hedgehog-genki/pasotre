class CreatePlannings < ActiveRecord::Migration[6.0]
  def change
    create_table :plannings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :level, null: false, default: 10
      t.float :condition, null: false, default: 1.0
      t.integer :adjustment, null: false, default: 0
      t.string :focus
      t.integer :allowed_time, null: false

      t.timestamps
    end
  end
end
