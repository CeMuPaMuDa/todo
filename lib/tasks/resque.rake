# frozen_string_literal: true

namespace :resque do
  task setup: :environment do
    Resque.redis = Redis.new Rails.application.config_for(:queue)
  end

  task setup_schedule: :setup do
    require 'resque-scheduler'
    Resque.schedule = YAML.load_file(Rails.root.join('config/resque_schedule.yml'))
  end

  task scheduler: :setup_schedule
end
