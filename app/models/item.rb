# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  completed   :boolean          default(FALSE)
#  deadline    :datetime
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_id    :bigint
#
# Indexes
#
#  index_items_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#
class Item < ApplicationRecord
  belongs_to :event

  validates :title, presence: true
  validates :title, length: { in: 3..25 }
  validates :description, length: { maximum: 300 }
  # validate :deadline_valid?
end
