# frozen_string_literal: true

namespace :events do
  desc 'Статистика задач'
  task stats: :environment do
    uname = User.all.reduce([]) { |arr, el| arr << el.name }.sort

    uname.each do |usr|
      puts '--------------------------------------------'
      puts "Пользователь: #{usr}"
      ev = Event.where(user_id: User.where(name: usr).ids)
      ename = ev.reduce([]) { |arr, el| arr << el.title }.sort
      puts "Список дел: #{ename}, всего: #{ev.count}"
      ename.each do |evt|
        puts "     Делo: #{evt}"
        im = Item.where(event_id: Event.where(title: evt).ids)
        puts "         Подпунктов у дела: #{im.count}\n\n"
      end
    end
  end
end
