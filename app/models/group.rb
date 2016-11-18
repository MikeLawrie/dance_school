class Group < ApplicationRecord
  has_many :lessons   
  scope :by_title, -> { order(:title) }
end
