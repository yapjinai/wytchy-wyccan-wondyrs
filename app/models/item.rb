class Item < ApplicationRecord
  has_many :items_users
  has_many :users, through: :items_users #who own them

  has_many :items_spells
  has_many :spells, through: :items_spells #for which they are required
end
