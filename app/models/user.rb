class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :trackable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :student

#  after_create :create_student

  after_save :create_student, :if => proc { |l| l.confirmed_at_changed? && l.confirmed_at_was.nil? }
  private

  def create_student
    student = Student.new
    student.user_id = self.id 
    student.email = self.email
    student.first_name = self.first_name
    student.last_name = self.last_name
    student.save
  end

end
