class CastingsController < ApplicationController

# CREATE
  def new

  end

  def create
    spell_id = params[:casting][:spell_id].to_i
    @spell = Spell.find_by(id: spell_id)
    if sufficient_items?(@logged_in_user, @spell)
      cast_spell(@logged_in_user, @spell)
      flash[:notice] = "#{@spell.name} cast."
      redirect_to @logged_in_user
    else
      flash[:notice] = "Insufficient items for #{@spell.name}."
      redirect_to @spell
    end
  end

# READ

# UPDATE
  def edit

  end

  def update

  end

# DELETE
  def destroy

  end

# OTHER
  def sufficient_items?(user, spell)
    sufficient_flag = true
    spell.recipes.each do |r|
      possession = user.possessions.find_by(item: r.item)
      if !possession || possession.quantity < r.quantity
        sufficient_flag = false
      end
    end
    sufficient_flag
  end

  def cast_spell(user, spell)
    spell.recipes.each do |r|
      possession = user.possessions.find_by(item: r.item)
      possession.quantity -= r.quantity
      if possession.quantity == 0
        possession.destroy
      end
      possession.save
    end
  end

end
