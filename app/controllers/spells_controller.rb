class SpellsController < ApplicationController
  skip_before_action :authorized

  def index
    @spells = Spell.all
  end

  def show
    @casting = Casting.new
    @spell = Spell.find_by(id: params[:id])
  end
end
