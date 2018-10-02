class UsersController < ApplicationController


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
    puts "@ user is " + session[:user_id].to_s
  end

  def update
    @user = @user.update(user_params)
    redirect_home
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
      redirect_home
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
    if session[:user_id] == nil
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :gender, :birthday, :bloodtype)
  end

  def redirect_home
    redirect_to root_path
  end

end
