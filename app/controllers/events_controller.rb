require 'date'

class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcoming_events = Event.upcoming_events
    @previous_events = Event.previous_events.all
      

  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      @event.attendees << current_user
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
  def event_params
    params.require(:event).permit(:date, :title, :description)
  end
  #binding pry
end
