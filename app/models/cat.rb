require 'date'

class Cat < ActiveRecord::Base
  CAT_COLORS = ['brown', 'orange', 'black', 'white', 'purple', 'gray']

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: CAT_COLORS, message: 'Pick a different color.' }
  validates :sex, inclusion: { in: ['M', 'F'], message: "Only 'M' and 'F' are valid inputs." }

  def age
    age = ((Date.today - self.birth_date).to_i) / 365
    if age != 0
      return age < 2 ? "#{age} year" : "#{age} years"
    else
      age = ((Date.today - self.birth_date).to_i) / 30
    end
    "#{age} months"
  end
end
