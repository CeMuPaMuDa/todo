namespace :close do
  desc "Автовыполнение просроченых заданий"
  task event_deadline: :environment do
    CloseExpiredEventsJob.perform_now 1.week.ago
  end

end
