# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  paginates_per 3

  validates :title, presence: true
  validates :title, length: { in: 3..25 }
  validates :description, length: { maximum: 500 }
  # validate :deadline_valid?
end
