namespace :create do
  desc 'Создание пользователя'
  task user: :environment do
    our_users = 1.times.map do
      {
        name: FFaker::Internet.user_name,
        email: FFaker::Internet.free_email
      }
    end
    User.create! our_users
  end
end