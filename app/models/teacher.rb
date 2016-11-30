class Teacher < ApplicationRecord
  has_many :lessons_teachers
  has_many :lessons, through: :lessons_teachers
  
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/photos/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  scope :by_name, -> { order(:name) }

end
