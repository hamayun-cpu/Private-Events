class EventsController < ApplicationController
  before_action :logged_in_user, only: %i[show create new]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new
    @event = current_user.created_events.build(events_params) if current_user
    if @event.save
      flash[:success] = 'event created'
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    # @event = Event.first
    @event = Event.find(params[:id])
  end

  private

  def events_params
    params.require(:event).permit(:description, :event_date)
  end
end
