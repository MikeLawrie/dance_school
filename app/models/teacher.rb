class Teacher < ApplicationRecord
  has_many :lessons_teachers
  has_many :lessons, through: :lessons_teachers
end