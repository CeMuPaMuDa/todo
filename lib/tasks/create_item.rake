namespace :create do
  desc 'Создание пользователя'
  task item: :environment do
    our_items = 1.times.map do
      {
        title: FFaker::CheesyLingo.title,
        description: FFaker::CheesyLingo.sentence,
        deadline: FFaker::Time.datetime
      }
    end
    Item.create! our_items
  end
end
