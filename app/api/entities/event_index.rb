module Entities
  class EventIndex < Grape::Entity
    include ActionView::Helpers::TextHelper
    root 'event', 'events'

    expose :id, :title, :description, :completed, :deadline

    def description
      truncate(object.description)
    end
  end
end