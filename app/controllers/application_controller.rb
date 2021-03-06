class ApplicationController < ActionController::Base
  before_action :find_user, :authorized
  skip_before_action :authorized, only: [:new, :create]

  def index
    if session[:user_id]
      # user is already logged in
      redirect_to '/home'
    end
  end

  private
  def pluralize(number, text)
    if number != 1
      "#{number} #{text.pluralize}"
    else
      "#{number} #{text}"
    end
  end

  def find_user
    if session[:user_id]
      @logged_in_user = User.find_by(id: session[:user_id])
      if @logged_in_user == nil
        # this user id isn't in the database, delete this session
        #redirect_to '/logout'
        puts "LOGGED IN USER NOT IN DB"
        session.delete(:user_id)
      end
    end
  end

  def current_user
    if session[:user_id]
      @logged_in_user = User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def disable_breadcrumbs
    @disable_breadcrumbs = true
  end
end
