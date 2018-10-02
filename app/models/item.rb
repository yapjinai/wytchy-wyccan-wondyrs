class Item < ApplicationRecord
  has_many :possessions
  has_many :users, through: :possessions #who own them

  has_many :recipes
  has_many :spells, through: :recipes #for which they are required
end
