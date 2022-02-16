module Entities
  class User < Grape::Entity

    root 'user', 'users'

    expose :id, :name, :role

    def role
      object.role.alias_name
    end
  end
end