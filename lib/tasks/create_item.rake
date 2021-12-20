# frozen_string_literal: true

namespace :create do
  desc 'Создание подзадачи'
  task item: :environment do
    our_items = {
      title: FFaker::CheesyLingo.title,
      description: FFaker::CheesyLingo.sentence,
      deadline: (Time.now + rand(1..12).month)
    }

    Item.create! our_items
  end
end
