module Entities
  class User < Grape::Entity

    root 'user', 'users'

    expose :name, :email
    expose :role, using: 'Entities::Role' do |user, _|
      user.role
    end


  end
end