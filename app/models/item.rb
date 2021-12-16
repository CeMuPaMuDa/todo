# frozen_string_literal: true

class Item < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { in: 3..25 }
  validates :description, length: { maximum: 180 }
end
