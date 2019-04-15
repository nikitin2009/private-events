class EventsController < ApplicationController
  include SessionsHelper

  before_action :require_logged_in, only: [:create]

  def index
    @previous_events = Event.previous
    @upcoming_events = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find_by(id: params[:id])
    unless current_user.nil?
      @new_invitation = @event.invitations.build(sender_id: current_user.id)
      @user_options = User.all.map { |u| [ u.name, u.id ] if @event.can_invite?(u) && u != current_user }
      @user_options.compact!
    end
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

  def require_logged_in
    if current_user.nil?
      redirect_to signin_path
    end
  end
end
