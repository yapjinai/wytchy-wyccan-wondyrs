class Recipe < ApplicationRecord
  belongs_to :item
  belongs_to :spell
end
