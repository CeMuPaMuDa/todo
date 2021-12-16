# frozen_string_literal: true

namespace :create do
  desc 'Создание пользователя'
  task item: :environment do
    our_items = {
      title: FFaker::CheesyLingo.title,
      description: FFaker::CheesyLingo.sentence,
      deadline: FFaker::Time.datetime
    }

    Item.create! our_items
  end
end
