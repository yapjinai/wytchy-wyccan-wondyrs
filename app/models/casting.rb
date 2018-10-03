class Casting < ApplicationRecord
  belongs_to :spell
  belongs_to :user

  validates :subject_1, presence: true
end
