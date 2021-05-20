class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :name, null: false
      t.string :part, null: false
      t.integer :point, null: false
      t.integer :time, null: false
      t.float :basis, null: false

      t.timestamps
    end
  end
end
