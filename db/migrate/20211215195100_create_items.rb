# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items, comment: 'Часть задачи(события)' do |t|
      t.string :title,
               comment: 'Название подзадачи'
      t.text :description,
             comment: 'Краткое описание подзадачи'
      t.boolean :completed,
                default: false,
                comment: 'Завершена? Да (true) / Нет (false)'
      t.datetime :deadline,
                 comment: 'Дата и время завершения (по плану)'
      t.timestamps
    end
  end
end
