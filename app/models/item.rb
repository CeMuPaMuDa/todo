# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                                                 :bigint           not null, primary key
#  completed(Завершена? Да (true) / Нет (false))      :boolean          default(FALSE)
#  deadline(Дата и время завершения (по плану))       :datetime
#  description(Краткое описание подзадачи)            :text
#  title(Название подзадачи)                          :string
#  created_at                                         :datetime         not null
#  updated_at                                         :datetime         not null
#  event_id(Внешний ключ для связи с таблицей events) :bigint
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
