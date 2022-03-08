namespace :mails do
  desc "Рассылка письма о дедлайне событий"
  task event_deadline: :environment do
    event_finish = Event.select{|e| e.deadline < (Time.now + 5.day)}
                        .group_by{ |e| e.user_id }
    event_finish.each do |user_id, event|
      user = User.find(user_id)
      EventMailer.user_deadlines(user, event).deliver_now
  end
  end
end
