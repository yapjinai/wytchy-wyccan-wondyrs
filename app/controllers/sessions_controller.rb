class SessionsController < ApplicationController
  skip_before_action :find_user, only: [:new, :create]
  before_action :disable_breadcrumbs, only: [:new]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash[:error] = "Username or password not recognized."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end
