class PossessionsController < ApplicationController
  # CREATE
    def new
      @items_options = Item.all.map { |i| [i.symbol, i.id] }
      @possession = Possession.new
    end

    def create
      symbol = params[:symbol].strip
      @item = Item.find_by(symbol: symbol)
      if @item == nil
        if symbol.empty?
          flash[:notice] = "Please enter a glyph to summon an item."
        else
          @logged_in_user.tokens += 1
          @logged_in_user.save
          flash[:notice] = "No such glyph -- you earn a token for your efforts."
          flash[:symbol] = "✴️"
        end
      else
        add_to_possession
        flash[:notice] = "#{@item.name} summoned."
        flash[:symbol] = @item.symbol
      end
      redirect_to items_path
    end

    def purchase
      @item = Item.find_by(id: params[:item_id])
      if @item.price > @logged_in_user.tokens
        flash[:error] = "Not enough tokens!"
      else
        add_to_possession
        @logged_in_user.tokens -= @item.price
        @logged_in_user.save
        flash[:notice] = "#{@item.name} purchased. You now have #{pluralize(@logged_in_user.tokens, "token")}."
      end
      redirect_to items_path
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

    def add_to_possession
      @possession = Possession.find_or_create_by(item: @item, user: @logged_in_user)
      new_discovery
      if @possession.quantity == nil
        @possession.update(quantity: 1)
      else
        @possession.update(quantity: @possession.quantity + 1)
      end
    end

    def new_discovery
      if !Discovery.find_by(user: @logged_in_user, item: @item)
        Discovery.create(user: @logged_in_user, item: @item)
        flash[:discovery] = "You discovered #{@item.symbol} #{@item.name}! You will remember it's glyph forever."
        true
      else
        false
      end
    end
end
