module EventsHelper
  extend Grape::API::Helpers

  def events_scope(all)
    scope = Event.order(:id)
    all ? scope : scope.where(completed: false)
  end
end