class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :trackable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :student

  after_create :create_student

  private

  def create_student
    student = Student.new
    student.user_id = self.id 
    student.email = self.email
  end

end
