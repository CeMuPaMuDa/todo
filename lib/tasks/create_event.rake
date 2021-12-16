# frozen_string_literal: true

namespace :create do
  desc 'Создание пользователя'
  task event: :environment do
    our_events = {
      title: FFaker::CheesyLingo.title,
      description: FFaker::CheesyLingo.sentence,
      deadline: FFaker::Time.datetime
    }

    Event.create! our_events
  end
end
