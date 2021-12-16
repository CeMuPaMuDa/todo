namespace :create do
  desc 'Создание пользователя'
  task event: :environment do
    our_events = 1.times.map do
      {
        title: FFaker::CheesyLingo.title,
        description: FFaker::CheesyLingo.sentence,
        deadline: FFaker::Time.datetime
      }
    end
    Event.create! our_events
  end
end
