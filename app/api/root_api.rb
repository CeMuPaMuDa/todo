# frozen_string_literal: true

class RootApi < Grape::API
  format :json
  prefix :api

  resource :events do
    desc 'Список дел'
    get '/' do
      Event.all
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
end
