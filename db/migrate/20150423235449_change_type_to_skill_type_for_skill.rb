class ChangeTypeToSkillTypeForSkill < ActiveRecord::Migration
  def change
  	rename_column :skills, :type, :skill_type
  end
end
