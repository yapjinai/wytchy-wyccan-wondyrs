class SpellsController < ApplicationController
  skip_before_action :authorized

  def index
    @spells = Spell.all
  end

  def show
    @casting = Casting.new
    @spell = Spell.find_by(id: params[:id])
    @discovered_items = Discovery.where(user: @logged_in_user).map do |d|
      d.item
    end 
  end
end
