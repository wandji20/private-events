class EventsController < ApplicationController
  before_action :set_event, only: %i[create new show]
  # before_action :authenticate_user, only: %i[create new show]
  def index
    @upcoming_events = Event.upcoming_events
    @previous_events = Event.previous_events
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
  end

  private

  def set_event
    redirect_to new_session_path if current_user.nil?
  end

  def event_params
    params.require(:event).permit(:date, :title, :description)
  end
end
