# frozen_string_literal: true

namespace :create do
  desc 'Создание события'
  task event: :environment do
    our_events = {
      title: FFaker::CheesyLingo.title,
      description: FFaker::CheesyLingo.sentence,
      deadline: (Time.now + rand(1..12).month)
    }

    Event.create! our_events
  end
end
