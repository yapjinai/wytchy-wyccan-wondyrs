class CastingsController < ApplicationController

# CREATE
  # def new
  #   @spells_options = Spell.all.map { |s| [s.name, s.id] }
  #   @casting = Casting.new
  # end

  def create
    spell_id = params[:casting][:spell_id].to_i
    @subject_1 = params[:casting][:subject_1] || ""
    @subject_2 = params[:casting][:subject_2] || ""
    @spell = Spell.find_by(id: spell_id)
    if !sufficient_items?
      flash[:error] = "Insufficient items for #{@spell.name}."
      # maybe direct to home instead?
      redirect_to @spell
    elsif !sufficient_subjects?
      flash[:error] = "Subject(s) required!"
      redirect_to @spell
    else
      cast_spell
      flash[:spell] = "#{@spell.name} cast."
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
  def sufficient_items?
    sufficient_flag = true
    @spell.recipes.each do |r|
      possession = @logged_in_user.possessions.find_by(item: r.item)
      if !possession || possession.quantity < r.quantity
        sufficient_flag = false
      end
    end
    sufficient_flag
  end

  def sufficient_subjects?
    !@subject_1.empty? && !(@subject_2.empty? && @spell.binate)
  end

  def cast_spell
    now = Time.now
    #create casting
    casting = Casting.create(
      user: @logged_in_user,
      spell_id: @spell.id,
      subject_1: @subject_1,
      subject_2: @subject_2,
      finished_at: now.advance(seconds: @spell.duration)
    )

    #deplete inventory
    @spell.recipes.each do |r|
      possession = @logged_in_user.possessions.find_by(item: r.item)
      possession.quantity -= r.quantity
      if possession.quantity == 0
        possession.destroy
      end
      possession.save
    end
  end

end
