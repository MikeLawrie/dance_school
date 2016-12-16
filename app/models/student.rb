class Student < ApplicationRecord
  belongs_to :user, optional: true
  has_many :students_lessons
  has_many :lessons, through: :students_lessons

  validates :first_name, presence: true  
  validates :last_name, presence: true    
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  #paginates_per 5

  scope :by_last_name, -> { order(:last_name) } # убирать?

  def self.search(term)
    if term
      term.capitalize!
      where('last_name LIKE ?', "%#{term}%")
    else
      all
    end
  end

end
