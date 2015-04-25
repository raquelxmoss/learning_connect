class SkillsController < ApplicationController
	
	def index
		puts "INDEX"
		@skills = Skill.all
		if params[:search]
			@skills = Skill.search(params[:search])
		else
			@skills = Skill.all
		end	
	end

	def list
		puts "LIST"
		@skills = Skill.all
		if params[:search]
			@skills = Skill.search(params[:search])
		else
			@skills = Skill.all
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
