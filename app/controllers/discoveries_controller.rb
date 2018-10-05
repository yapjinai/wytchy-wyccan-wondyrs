class DiscoveriesController < ApplicationController

  def index
    @discoveries = Discovery.where(user: @logged_in_user)
  end

end
