class Teacher < ApplicationRecord
  has_many :lessons_teachers
  has_many :lessons, through: :lessons_teachers
  
  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/photos/:style/missing.png"
  validates_attachment :photo,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"]},
    size: { in: 0..2.megabytes }

  scope :by_name, -> { order(:name) }

end
