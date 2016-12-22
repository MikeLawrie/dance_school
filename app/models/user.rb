class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :trackable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :student

  after_save :student_to_user, if: proc { |l| l.confirmed_at_changed? && l.confirmed_at_was.nil? }

  private

  def create_student
    student = Student.new
    student.user_id = id
    student.email = email
    student.first_name = first_name
    student.last_name = last_name
    student.save
  end

  def student_to_user
    stud = Student.where(email: email).first
    stud ? self.student = stud : create_student
  end
end
