class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :tutor_id
      t.integer :learner_id

      t.timestamps null: false
    end
  end
end
