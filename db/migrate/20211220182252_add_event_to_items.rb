# frozen_string_literal: true

class AddEventToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :event, null: false, foreign_key: true
  end
end
