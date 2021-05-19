class CreatePlannings < ActiveRecord::Migration[6.0]
  def change
    create_table :plannings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :level
      t.float :condition
      t.integer :adjustment
      t.string :focus
      t.integer :allowed_time

      t.timestamps
    end
  end
end
