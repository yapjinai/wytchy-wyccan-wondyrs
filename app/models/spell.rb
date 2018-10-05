class Spell < ApplicationRecord
  has_many :recipes
  has_many :items, through: :recipes #that they require

  has_many :castings
  has_many :users, through: :castings #who cast them

  def duration_props
    props = {}
    if self.duration > 3600
      duration = self.duration / 3600
      label = 'hours'
    elsif self.duration > 240
      duration = self.duration / 60
      label = 'minutes'
    else
      duration = self.duration
      label = 'seconds'
    end
    props[:duration] = duration
    props[:label] = label
    byebug
    props
  end
end
