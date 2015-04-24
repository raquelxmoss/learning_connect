class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :description
      t.string :type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
