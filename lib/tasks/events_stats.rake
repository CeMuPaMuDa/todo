namespace :events do
  desc 'Статистика задач'
  task stats: :environment do
  uname = User.all.reduce([]){|arr, el| arr << el.name}.sort

  uname.each do |usr|
    puts '--------------------------------------------'
    print "Пользователь: #{usr}\n \n"
    ev = Event.where(user_id: User.where(name: usr).ids)
    ename = ev.reduce([]){|arr, el| arr << el.title}.sort
    print "Список дел: #{ename}, всего: #{ev.count}\n\n"
      ename.each do |evt|
        print "     Делo: #{evt}\n"
        im = Item.where(event_id: Event.where(title: evt).ids)
        print "         Подпунктов у дела: #{im.count}\n\n"
      end
  end

  end
end
