# frozen_string_literal: true

class Events < Grape::API
  helpers FiltersHelper, EventsHelper

  resource :events do
    desc 'Список дел'
    params do
      use :filters
    end

    get '/' do
      events_scope(params[:all])
    end

    route_param :event_id, type: Integer do
      before do
        @event = Event.find params[:event_id]
      end

      get '/' do
        @event
      end

      post '/' do
        @event.destroy
      end
    end
  end
end
