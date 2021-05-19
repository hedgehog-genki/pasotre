class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :name
      t.string :part
      t.integer :point
      t.integer :time
      t.float :basis

      t.timestamps
    end
  end
end
