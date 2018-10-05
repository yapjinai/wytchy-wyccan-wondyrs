class Spell < ApplicationRecord
  has_many :recipes
  has_many :items, through: :recipes #that they require

  has_many :castings
  has_many :users, through: :castings #who cast them

  def duration_props
    props = {}
    if self.duration > 31536000
      duration = self.duration / 31536000
      label = 'years'
    elsif self.duration > 86400
      duration = self.duration / 86400
      label = 'days'
    elsif self.duration > 3600
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
    props
  end
end
