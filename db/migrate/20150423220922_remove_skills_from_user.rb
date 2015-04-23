class RemoveSkillsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :teaching_skills
    remove_column :users, :want_to_learn
  end
end
