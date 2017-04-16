class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by_token!(params[:id])
  end

end
