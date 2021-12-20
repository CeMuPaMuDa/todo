class Item < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { in: 3..25 }
  validates :description, length: { maximum: 300 }
  validate :deadline_valid?
end
