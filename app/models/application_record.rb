class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private


  def pluralize(number, text)
    if number != 1
      "#{number} #{text.pluralize}"
    else
      "#{number} #{text}"
    end
  end

end
