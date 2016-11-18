class Lesson < ApplicationRecord
  belongs_to :group, optional: true
  has_many :lessons_teachers
  has_many :teachers, through: :lessons_teachers
  has_many :students_lessons
  has_many :students, through: :students_lessons

  scope :by_time, -> { order(:start_time) }

#  validates :student_id, on: :update , uniqueness: true

  def sign_done(student)
    self.students << student
  end

  def sign_out_done(student)
    self.students.delete(student)
  end

  def student_present?(student)
    present = students_lessons.where(student_id: student.id) & students_lessons.where(lesson_id: self.id)
    present.any?
  end

end
