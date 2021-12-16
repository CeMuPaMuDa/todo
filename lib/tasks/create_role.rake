namespace :create do
  desc 'Создание пользователя'
  task role: :environment do
    our_roles = 1.times.map do
      {
        name: FFaker::Internet.domain_word,
        alias_name: FFaker::LoremRU.word
      }
    end
    Role.create! our_roles
  end
end
