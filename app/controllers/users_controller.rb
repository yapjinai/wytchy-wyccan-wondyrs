class UsersController < ApplicationController

  before_action :find_user

# CREATE
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

# READ
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

# UPDATE
  def edit
  end

  def update

  end

# DELETE
  def destroy

  end

###########
# OTHER

  # def authenticate
  #   session[:username] = params[:username]
  #   redirect_to 'home'
  # end

  def login
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      flash[:errors] ||= []
      flash[:errors] << "User doesn't exist"
      redirect_to root_path
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

  def home
    if !@user
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :gender, :birthday, :bloodtype)
  end

  def find_user
    if session[:user_id]
      @logged_in_user = User.find_by(id: session[:user_id])
    end
    if !@logged_in_user
      session.delete(:user_id)
    end
  end
end
