class SkillsController < ApplicationController

	def destroy
		skill = Skill.find(params[:id])
		skill.destroy()
	end
end
