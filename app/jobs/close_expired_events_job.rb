# frozen_string_literal: true

class CloseExpiredEventsJob < ApplicationJob
  queue_as :default

  def perform(ago = 1.week.ago)
    Event.where('deadline <=?', ago).update(completed: true)
    # raise 'Test failed Jobs'
  end
end
