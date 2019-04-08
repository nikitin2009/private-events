class EventsController < ApplicationController
  include SessionsHelper

  def index
    @previous_events = Event.previous
    @upcoming_events = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render "new"
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :description)
  end
end
