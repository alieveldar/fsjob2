class Api::EventsController < ApplicationController
 respond_to :json
 
 def index 	
 end

 def show
 	end_per = params[:end]
 	start_per = params[:start]
  @events = Event.where("start >= ? AND start <= ?", start_per, end_per) 
  render json: @events.map { |e| e.attributes.merge(url: event_path(e.id)) }
 end

 
end