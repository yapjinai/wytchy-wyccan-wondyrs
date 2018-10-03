class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @possession = Possession.new
    @item = Item.find_by(id: params[:id])
  end
end
