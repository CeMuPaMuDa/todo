class CloseExpiredEventsJob < ApplicationJob
  queue_as :default

  def perform(ago = 1.week.ago)
    Event.where('deadline <=?', ago).update(completed: true)
  end
end
