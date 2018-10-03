class ApplicationController < ActionController::Base
  before_action :find_user, :authorized
  skip_before_action :authorized, only: [:new, :create]

  def index
    if session[:user_id]
      # user is already logged in
      redirect_to '/home'
    end
  end

  def find_user
    if session[:user_id]
      @logged_in_user = User.find_by(id: session[:user_id])
      if @logged_in_user == nil
        # this user id isn't in the database, delete this session
        #redirect_to '/logout'
        puts "LOGGED IN USER NOT IN DB"
      end
    end
  end

  def current_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end
end
