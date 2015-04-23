class CreateLearningObjectives < ActiveRecord::Migration
  def change
    create_table :learning_objectives do |t|
      t.integer :course_id
      t.text :objective
      t.timestamps null: false
    end
  end
end
