class SkillsController < ApplicationController
	
	def index
		@skills = Skill.all
		if params[:search]
		  @skills = (Skill.search(params[:search])).includes(:user)
		else
		  @skills = Skill.all.includes(:user)
		end	
		# render partial: 'skills', layout: false
		respond_to do |format|
		  format.html
		  format.js
		end
	end

	def create
		@skill = Skill.new(skill_params)
		if @skill.save(skill_params)
		  redirect_to user_path(params[:user_id])
		end
	end

	def destroy
		skill = Skill.find(params[:id])
		skill.destroy()
		redirect_to user_path(params[:user_id])
	end

  private
  def skill_params
    params.require(:skill).permit(:user_id, :description, :skill_type)
  end
end
