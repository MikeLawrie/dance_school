class Lesson < ApplicationRecord
  belongs_to :group, optional: true
  has_many :lessons_teachers
  has_many :teachers, through: :lessons_teachers
end
