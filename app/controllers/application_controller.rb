class ApplicationController < ActionController::Base

  def index
    if session[:user_id]
      # user is already logged in
      redirect_to '/home'
    end
  end

end
