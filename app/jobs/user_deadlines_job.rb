# frozen_string_literal: true

class UserDeadlinesJob < ApplicationJob
  queue_as :default

  def perform(ddl = Time.zone.now + 1.day)
    event_finish = Event.select { |e| e.deadline < ddl }
                        .group_by(&:user_id)
    event_finish.each do |user_id, event|
      user = User.find(user_id)
      EventMailer.user_deadlines(user, event).deliver_now
    end
  end
end
