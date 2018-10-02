class ApplicationController < ActionController::Base
  before_action :find_user

  def index
    if session[:user_id]
      # user is already logged in
      redirect_to '/home'
    end
  end

  def find_user
    # byebug
    if session[:user_id]
      @logged_in_user = User.find_by(id: session[:user_id])
      if @logged_in_user == nil
        # this user id isn't in the database, delete this session
        redirect_to '/logout'
      end
    end
  end
end
