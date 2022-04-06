# frozen_string_literal: true

module Entities
  class Event < Grape::Entity
    include ActionView::Helpers::TextHelper
    root 'event', 'events'

    expose :id, :title, :description, :completed, :deadline
    expose :user, using: 'Entities::User' do |event, _|
      event.user
    end

    def description
      truncate(object.description)
    end
  end
end
