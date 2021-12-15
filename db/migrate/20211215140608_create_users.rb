# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, comment: 'Пользователь приложения' do |t|
      t.with_options index: { unique: true } do
        string  :name,
                comment: 'Имя(никнейм/логин) пользователя'
        string  :email,
                comment: 'E-mail пользователя'
      end
      t.boolean :active,
                default: true,
                comment: 'Состояние пользователя: активен(true), забанен(false)'
      t.timestamps
    end
  end
end
