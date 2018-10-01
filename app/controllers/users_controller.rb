class UsersController < ApplicationController

# CREATE
  def new

  end

  def create

  end

# READ
  def index

  end

  def show

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

  def login
  end

  def authenticate
    session[:username] = params[:username]
    redirect_to 'home'
  end

  def home
  end

end
