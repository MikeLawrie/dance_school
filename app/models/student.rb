class Student < ApplicationRecord
  belongs_to :user, optional: true
  has_many :students_lessons
  has_many :lessons, through: :students_lessons

  #paginates_per 5

  scope :by_last_name, -> { order(:last_name) } # убирать?

  def self.search(term)
    if term
      term.capitalize!
      where('last_name LIKE ?', "%#{term}%")
    else
      all
    end
  end

end
