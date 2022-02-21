# frozen_string_literal: true

class Events < Grape::API
  include Grape::Kaminari
  helpers FiltersHelper, EventsHelper, Pundit

  resource :events do
    desc 'Список дел'
    params do
      use :filters
      use :pagination, per_page: 5, max_per_page: 5, offset: 0
    end

    get '/' do
      scope = policy_scope(events_scope(params[:all]))
      # present paginate(events_scope(params[:all])), with: Entities::EventIndex
      present paginate(scope), with: Entities::EventIndex
    end

    route_param :event_id, type: Integer do
      before do
        @event = Event.find params[:event_id]
      end

      get '/' do
        authorize @event, :show?
        present @event, with: Entities::Event
      end

      post '/' do
        @event.destroy
      end
    end
  end
end
