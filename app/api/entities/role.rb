# frozen_string_literal: true

module Entities
  class Role < Grape::Entity
    root 'role', 'roles'

    expose :name, :alias_name
  end
end
