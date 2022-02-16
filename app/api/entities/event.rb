# frozen_string_literal: true

module Entities
  class Event < Grape::Entity
    root 'event', 'events'

    expose :id, :title, :description
  end
end
