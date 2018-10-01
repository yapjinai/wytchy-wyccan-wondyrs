class Item < ApplicationRecord
  has_many :users #via inventory
  has_many :spells #for which they are required
end
