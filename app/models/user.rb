class User < ApplicationRecord
  # username
  # gender
  # birthday
  # bloodtype
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :items_users
  has_many :items, through: :items_users # that they own

  has_many :spells_users
  has_many :spells, through: :spells_users # that they cast
end
