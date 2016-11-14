class Student < ApplicationRecord
  belongs_to :user, optional: true
  has_many :students_lessons
  has_many :lessons, through: :students_lessons

end
