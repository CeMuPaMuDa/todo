class ItemsController < ApplicationController
  before_action :set_event
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    @items = @event.items
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = @event.items.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = @event.items.build(item_params)

    if @item.save
      redirect_to([@item.event, @item], notice: 'Item was successfully created.')
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update_attributes(item_params)
      redirect_to([@item.event, @item], notice: 'Item was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy

    redirect_to event_items_url(@event)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_item
      @item = @event.items.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:title, :description, :completed, :deadline, :event_id)
    end
end
