class Spell < ApplicationRecord
  has_many :recipes
  has_many :items, through: :recipes #that they require

  has_many :castings
  has_many :users, through: :castings #who cast them
end
