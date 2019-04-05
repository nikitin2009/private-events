class EventsController < ApplicationController
  include SessionsHelper

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show

  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path
    else
      render "new"
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date)
  end
end
