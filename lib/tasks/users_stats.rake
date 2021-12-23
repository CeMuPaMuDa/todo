# frozen_string_literal: true

namespace :users do
  desc 'Статистика подзадач пользователей'
  task :stats, [:user] => :environment do |_task, args|
    args.with_defaults(user: User.last.name)
    user = User.find_by(name: args[:user])
    puts "Пользователь: #{args[:user]}\nСписок подзадач:"
    puts '_______________________________________'
      user.events.map do |e|
      hash = e.items.map(&:id).zip(e.items.map(&:title)).to_h
      hash.each { |k, v| puts "id: #{k} | title: #{v}" }
    end
  end
end
