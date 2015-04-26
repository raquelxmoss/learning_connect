class SkillsController < ApplicationController

  before_filter :get_user

	def create
		@skill = Skill.new(skill_params)
		if @skill.save(skill_params)
		  # redirect_to user_path(params[:user_id])
      render partial: 'show', layout: false
    else
      render json: @skill, status: :unprocessable_entity
		end
	end

	def destroy
		@skill = @user.skills.find(params[:id])
		if @skill.destroy
      render json: @skill, status: :ok
    else
      render json: @skill, status: :unprocessable_entity
    end
	end

  private
  def skill_params
    params.require(:skill).permit(:user_id, :description, :skill_type)
  end

  def get_user
    @user = User.find(params[:user_id])
  end

end

