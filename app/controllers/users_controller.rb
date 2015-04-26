class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  before_filter :get_user, only:[:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    if current_user
      @connection = Connection.find_by(initializer_id:current_user.id, receiver_id: @user.id) || @connection = Connection.find_by(initializer_id:@user.id, receiver_id: current_user.id)
      @connections = @user.initializer_connections + @user.receiver_connections
    end
  end

  def edit
  end

  def update
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

  def get_user
    @user = User.find(params[:id])
  end

end
