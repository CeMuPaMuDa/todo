module Service 
  class Statistics
    class << self
      def users_name 
       uname = User.all.reduce([]){|arr, el| arr << el.name}.sort

    uname.each do |usr|
      print "Пользователь: #{usr}\n"
      ev = Event.where(user_id: User.where(name: usr).ids)
      ename = ev.reduce([]){|arr, el| arr << el.title}.sort
      print "Дела: #{ename}\n"
      ename.each do |evt|
        print "Делo: #{}\n"
      im = Item.where(event_id: Event.where(name: evt).ids)
      print "Подпунктов: #{im.count}"
      end
      
    end


      end


    end
  end
end