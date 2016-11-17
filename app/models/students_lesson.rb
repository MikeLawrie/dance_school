class StudentsLesson < ApplicationRecord
  belongs_to :lesson
  belongs_to :student

  validates :student_id, :uniqueness => { :scope => :lesson_id }
end
