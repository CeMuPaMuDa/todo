namespace :create do
  desc 'Заполнение таблиц данными'
  task data: [:user, :event, :item, :role, :environment] do
    puts 'Данные внесены'
  end
end
