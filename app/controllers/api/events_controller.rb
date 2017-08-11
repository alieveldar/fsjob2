class Api::EventsController < ApplicationController
  respond_to :json
  def index 	
  end
  
  def show   
    events = EventsController.all_events(params[:start], params[:end])
    events = events.map do |e| 
      curl = {"url" => (event_path(e["id"]))}
      e.merge(curl)
    end
    render json: events
  end
end 


