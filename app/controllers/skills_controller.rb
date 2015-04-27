class SkillsController < ApplicationController
	before_action :authenticate_user!
	before_filter :get_user, except: [:index]

	def index
    #changing Skill.search to return Skill.all when search is nil would symplify this
	  @skills = Skill.all
	  if params[:search]
	    @skills = (Skill.search(params[:search])).includes(:user)
	  else
	    @skills = Skill.all.includes(:user)
	  end
	  respond_to do |format|
		  format.html
		  format.js
		end
	end

	def create
	  @skill = Skill.new(skill_params)
	  if @skill.save(skill_params)
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

