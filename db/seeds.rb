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

roles = Role.create([
                      { name: 'admin', alias_name: 'админ' },
                      { name: 'user', alias_name: 'пользователь' }
                    ])

hash_users = 25.times.map do
  {
    name: FFaker::Internet.user_name[0..15],
    email: FFaker::Internet.free_email,
    role: roles.sample
  }
end

users = User.create hash_users

hash_events = 42.times.map do
  {
    title: FFaker::CheesyLingo.title,
    description: FFaker::CheesyLingo.sentence,
    deadline: (Time.now + rand(1..1100).day),
    user: users.sample
  }
end

events = Event.create hash_events

hash_items = 250.times.map do
  {
    title: FFaker::CheesyLingo.title,
    description: FFaker::CheesyLingo.sentence,
    deadline: (Time.now + rand(1..1100).day),
    event: events.sample
  }
end

Item.create hash_items
