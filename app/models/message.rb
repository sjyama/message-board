class Message < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  #validates :content, numericality: true
  validates :title, presence: true, length: { maximum: 255 }
end
