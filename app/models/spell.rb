class Spell < ApplicationRecord
  has_many :items #that they require
  has_many :users #who cast them
end
