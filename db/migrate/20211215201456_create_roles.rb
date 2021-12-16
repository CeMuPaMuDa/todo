# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles, comment: 'Роль пользователей' do |t|
      t.string :name, comment: 'Название англ: Administrator, User'
      t.string :alias_name, comment: 'Псевдоним на рус.'
      t.timestamps
    end
  end
end
