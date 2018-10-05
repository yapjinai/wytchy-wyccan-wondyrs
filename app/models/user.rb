class User < ApplicationRecord
  # username
  # gender
  # birthday
  # bloodtype
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :possessions
  has_many :items, through: :possessions # that they own

  has_many :castings
  has_many :spells, through: :castings # that they cast

  def can_cast?(spell)
    can_cast_flag = true
    spell.recipes.each do |r|
      possession = self.possessions.find_by(item: r.item)
      if !possession || possession.quantity < r.quantity
        can_cast_flag = false
      end
    end
    can_cast_flag
  end

  def items_required(spell)
    shopping_list = []
    spell.recipes.each do |r|
      possession = self.possessions.find_by(item: r.item)
      if !possession
        shopping_list << pluralize(r.quantity, r.item.name)
      elsif !possession || possession.quantity < r.quantity
        shopping_list << pluralize(r.quantity - possession.quantity, r.item.name)
      end
    end
    "You need: #{shopping_list.join(", ")}."
  end
end
