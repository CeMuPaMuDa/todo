# frozen_string_literal: true

module EventsHelper
  extend Grape::API::Helpers

  def events_scope(all)
    scope = Event.order(:id)
    #  .includes(user: :role)
    all ? scope : scope.where(completed: false)
  end
end
