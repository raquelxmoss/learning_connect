class SkillsController < ApplicationController
	def destroy
		skill = Skill.find(params[:id])
		skill.destroy()
		redirect_to user_path(params[:user_id])
	end
end
