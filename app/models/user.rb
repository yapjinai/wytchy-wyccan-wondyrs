class User < ApplicationRecord
  # username
  # gender
  # birthday
  # bloodtype

  validates :username, presence: true, uniqueness: true

  has_many :possessions
  has_many :items, through: :possessions # that they own

  has_many :castings
  has_many :spells, through: :castings # that they cast
end
