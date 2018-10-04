class PossessionsController < ApplicationController
  # CREATE
    def new
      @items_options = Item.all.map { |i| [i.symbol, i.id] }
      @possession = Possession.new
    end

    def create
      # byebug
      # item_id = params[:possession][:item_id].to_i
      # @item = Item.find_by(id: item_id)
      #
      # @possession = Possession.find_or_create_by(item_id: item_id, user_id: @logged_in_user.id)
      #
      # quantity = @possession.quantity
      # quantity ||= 0
      # quantity += 1
      # @possession.update(quantity: quantity)
      #
      # flash[:notice] = "#{@item.name} purchased."
      # redirect_to @item

      symbol = params[:symbol].strip
      item = Item.find_by(symbol: symbol)
      if item == nil
        flash[:notice] = "No such glyph -- you earn a token for your efforts."
        flash[:symbol] = "✴️"
      else
        @possession = Possession.find_or_create_by(item: item, user: @logged_in_user)
        if @possession.quantity == nil
          @possession.update(quantity: 1)
        else
          @possession.update(quantity: @possession.quantity + 1)
        end
        flash[:notice] = "#{item.name} purchased."
        flash[:symbol] = item.symbol
      end
      redirect_to items_path
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
        redirect_to home_path
      end
    end

    def discard_all
      possession = Possession.find_by(id: params[:possession][:id])
      possession.destroy
      redirect_to home_path
    end

end
