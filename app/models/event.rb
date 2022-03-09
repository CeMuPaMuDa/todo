# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id                                               :bigint           not null, primary key
#  completed(Завершена? Да (true) / Нет (false))    :boolean          default(FALSE)
#  deadline(Дата и время завершения (по плану))     :datetime
#  description(Краткое описание задачи)             :text
#  title(Название задачи)                           :string
#  created_at                                       :datetime         not null
#  updated_at                                       :datetime         not null
#  user_id(Внешний ключ для связи с таблицей users) :bigint
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Event < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  paginates_per 3

  validates :title, presence: true
  validates :title, length: { in: 3..25 }
  validates :description, length: { maximum: 500 }
  # validate :deadline_valid?
end
