class Group < ApplicationRecord
  has_many :lessons   
  validates :style, presence: true
  validates :title, presence: true
  scope :by_title, -> { order(:title) }
end
