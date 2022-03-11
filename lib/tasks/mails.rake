# frozen_string_literal: true

namespace :mails do
  desc 'Рассылка письма о дедлайне событий'
  task event_deadline: :environment do
    event_finish = Event.select { |e| e.deadline < (Time.zone.now + 1.day) }
                        .group_by(&:user_id)
    event_finish.each do |user_id, event|
      user = User.find(user_id)
      EventMailer.user_deadlines(user, event).deliver_now
    end
  end
end
