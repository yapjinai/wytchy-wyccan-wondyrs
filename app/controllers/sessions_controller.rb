class SessionsController < ApplicationController
  skip_before_action :find_user, only: [:new, :create]

  # login page
  def new
  end

  # create session + distribute cookie
  def create
  end

  # post from logout button to here
  # destroys session entry
  def destroy
  end

end
