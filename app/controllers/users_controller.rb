class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save(user_params)
      redirect_to users_path
    else
      render 'new'
    end
  end

  def new
    @user = User.new(user_params)
    render 'new'
  end

  private
  def user_params
    params.require(:user).permit(:all)
  end

end
