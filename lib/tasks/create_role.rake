# frozen_string_literal: true

namespace :create do
  desc 'Создание пользователя'
  task role: :environment do
    our_roles = {
      name: FFaker::Internet.domain_word,
      alias_name: FFaker::LoremRU.word
    }

    Role.create! our_roles
  end
end
