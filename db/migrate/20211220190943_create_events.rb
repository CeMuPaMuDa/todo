
class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table    :events, comment: 'Задача(событие)' do |t|
      t.string      :title,
                    comment: 'Название задачи'
      t.text        :description,
                    comment: 'Краткое описание задачи'
      t.boolean     :completed,
                    default: false,
                    comment: 'Завершена? Да (true) / Нет (false)'
      t.datetime    :deadline,
                    comment: 'Дата и время завершения (по плану)'
      t.references  :user, foreign_key: true,
                    comment: 'Внешний ключ для связи с таблицей users'
      t.timestamps
    end
  end
end