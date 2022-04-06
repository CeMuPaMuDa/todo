# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
Event.destroy_all
User.destroy_all
Role.destroy_all

default_role = Role.create!(name: 'Пользователь', alias_name: :default_user)
admin_role = Role.create!(name: 'Администратор', alias_name: :admin)

admin_email = 'admin@example.com'
User.create!  email: admin_email,
              password: admin_email,
              name: 'Админ',
              role: admin_role

hash_users = Array.new(25) do
  email = FFaker::Internet.safe_email
  {
    name: FFaker::Internet.user_name[0..15],
    email: email,
    password: email,
    role: default_role
  }
end

users = User.create! hash_users

hash_events = Array.new(42) do
  {
    title: FFaker::CheesyLingo.title,
    description: FFaker::Lorem.paragraph,
    deadline: (Time.zone.now + rand(1..15).day),
    user: users.sample
  }
end

events = Event.create! hash_events

hash_items = Array.new(250) do
  {
    title: FFaker::CheesyLingo.title,
    description: FFaker::CheesyLingo.sentence,
    deadline: (Time.zone.now + rand(1..15).day),
    event: events.sample
  }
end

Item.create! hash_items
