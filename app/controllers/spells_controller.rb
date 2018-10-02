class SpellsController < ApplicationController
  def index
    @spells = Spell.all
  end

  def show
    @spell = Spell.find_by(id: params[:id])
  end
end
