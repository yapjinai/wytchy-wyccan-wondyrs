class Spell < ApplicationRecord
  has_many :items_spells
  has_many :items, through: :items_spells #that they require

  has_many :spells_users
  has_many :users, through: :spells_users #who cast them
end
