# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :add_index_breadcrumb, only: %i[show edit new]

  # GET /events
  def index
    @events = policy_scope(Event).includes(:items).page(params[:page]).per(10)
  end

  # GET /events/1
  def show
    authorize @event
    add_breadcrumb "Event: #{@event.title}", event_path
  end

  # GET /events/new
  def new
    @event = Event.new
    add_breadcrumb 'New', new_event_path
  end

  # GET /events/1/edit
  def edit
    authorize @event
    add_breadcrumb "Event: #{@event.title}", event_path(@event)
    add_breadcrumb 'Edit', edit_event_path
  end

  # POST /events
  def create
    @event = Event.new(event_params.merge(user: current_user))
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    authorize @event
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    authorize @event
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :description, :completed, :deadline, :user)
  end

  def add_index_breadcrumb
    add_breadcrumb 'Events', events_path
  end
end
