class SessionsController < ApplicationController
  skip_before_action :find_user, only: [:new, :create]

  def new
  end

  def create 
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user 
    else 
      flash[:notice] = "Username or password not recognizd."
      redirect_to login_path
    end
  end 

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end 

end
