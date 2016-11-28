class Student < ApplicationRecord
  belongs_to :user, optional: true
  has_many :students_lessons
  has_many :lessons, through: :students_lessons

  scope :by_last_name, -> { order(:last_name) }

  def self.search(term)
    if term
      term.capitalize!
      where('last_name LIKE ?', "%#{term}%")
    else
      all
    end
  end

end
