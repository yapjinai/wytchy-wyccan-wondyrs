class User < ApplicationRecord
  # username
  # gender
  # birthday
  # bloodtype

  validates :username, uniqueness: true

  has_many :items #via inventory
  has_many :spells #that they cast
end
