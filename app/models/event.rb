# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { in: 3..25 }
  validates :description, length: { maximum: 500 }
end
