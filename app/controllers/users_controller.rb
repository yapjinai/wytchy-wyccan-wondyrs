class UsersController < ApplicationController
  skip_before_action :find_user, only: [:login, :logout, :authenticate]


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    puts "@ user is " + session[:user_id].to_s
  end

  def update
    @user = @user.update(user_params)
    redirect_home
  end

  def destroy

  end

# OTHER

  def home
    if session[:user_id] == nil
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :gender, :birthday, :bloodtype)
  end

  def redirect_home
    redirect_to root_path
  end

end
