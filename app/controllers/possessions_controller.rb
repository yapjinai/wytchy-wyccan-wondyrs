class PossessionsController < ApplicationController
  # CREATE
    def new
      @items_options = Item.all.map { |i| [i.name, i.id] }
      @possession = Possession.new
    end

    def create
      item_id = params[:possession][:item_id].to_i
      @item = Item.find_by(id: item_id)

      @possession = Possession.find_or_create_by(item_id: item_id, user_id: @logged_in_user.id)

      quantity = @possession.quantity
      quantity ||= 0
      quantity += 1
      @possession.update(quantity: quantity)

      flash[:notice] = "#{@item.name} purchased."
      redirect_to @logged_in_user
    end

  # READ

  # UPDATE
    def edit

    end

    def update

    end

  # DELETE
    def discard_one
      possession = Possession.find_by(id: params[:possession][:id])
      if possession.quantity == 1
        discard_all
      else
        possession.quantity -= 1
        possession.save
        redirect_to @logged_in_user
      end
    end

    def discard_all
      possession = Possession.find_by(id: params[:possession][:id])
      possession.destroy
      redirect_to @logged_in_user
    end

end