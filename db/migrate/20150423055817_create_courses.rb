class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :learner_id
      t.integer :tutor_id

      t.timestamps null: false
    end
  end
end
