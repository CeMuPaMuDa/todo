# frozen_string_literal: true

namespace :create do
  desc 'Создание пользователя'
  task user: :environment do
    our_users = {
      name: FFaker::Internet.user_name,
      email: FFaker::Internet.free_email
    }

    User.create! our_users
  end
end
