class Lesson < ApplicationRecord
  has_many :lessons_teachers
  has_many :teachers, through: :lessons_teachers
end
