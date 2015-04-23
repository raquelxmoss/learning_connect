class AddSkillsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :teaching_skills, :text
    add_column :users, :average_rating, :integer
    add_column :users, :about, :text
    add_column :users, :want_to_learn, :text
  end
end
