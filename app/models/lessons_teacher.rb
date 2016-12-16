class LessonsTeacher < ApplicationRecord
  belongs_to :lesson
  belongs_to :teacher

  validates :teacher_id, uniqueness: { scope: :lesson_id }
end
