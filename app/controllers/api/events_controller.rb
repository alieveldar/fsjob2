class Api::EventsController < ApplicationController
 respond_to :json
 
 def index
 end

 def show
 	@events = Event.all
  #render json: @events
  render json: @events.map { |e| e.attributes.merge(url: event_path(e.id)) }
 end
end