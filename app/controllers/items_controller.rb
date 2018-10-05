class ItemsController < ApplicationController
  skip_before_action :authorized

  def index
    @items = Item.all
    @discoveries = Discovery.where(user: @logged_in_user).map do |d|
      d.item
    end 
  end

  def show
    @possession = Possession.new
    @item = Item.find_by(id: params[:id])
  end
end
