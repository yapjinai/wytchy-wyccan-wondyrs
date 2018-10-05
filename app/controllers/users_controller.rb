class UsersController < ApplicationController
  skip_before_action :find_user, only: [:login, :logout, :authenticate]
  before_action :disable_breadcrumbs, only: [:new]

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
    @logged_in_user = @logged_in_user.update(user_params)
    redirect_home
  end

  def destroy
    @logged_in_user.destroy
    session.delete(:user_id)
    redirect_home
  end

# OTHER

  def home
    if session[:user_id] == nil
      redirect_to root_path
    end

    now = Time.now
    @current_spells = @logged_in_user.castings.select do |c|
      c.finished_at > now
    end.sort_by(&:created_at).reverse

    @old_spells = @logged_in_user.castings.select do |c|
      c.finished_at < now
    end.sort_by(&:created_at).reverse
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :gender, :birthday, :bloodtype)
  end

  def redirect_home
    redirect_to root_path
  end

end
