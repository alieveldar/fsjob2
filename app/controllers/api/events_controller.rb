class Api::EventsController < ApplicationController
  respond_to :json
  
  def index 	
  end
  def by_period(ev)
    steps = {"day" => 1.day, "week" => 1.week, "month" => 1.month, "year" => 1.year}
    @phantom_events = []
    @good_phantom_evens = []
    cur_time = params[:start]
    stop_time = (params[:end]).to_time
    event = ev
    test_v = "day"
    event.each do |e|
      curn_time = (cur_time).to_time
      if e.repeat != ""
        step = steps[e.repeat]
        start_time_event = e.start
        while (curn_time <= stop_time)  do      
          @phantom_events << e.attributes.merge("start" => start_time_event)
          start_time_event = start_time_event + step
          curn_time = start_time_event
        end
      else
        @phantom_events << e.attributes
      end
      @phantom_events = @phantom_events.select { |e| e["start"] >= params[:start] }
    end


      
      return @phantom_events
    end
    def all_events          
      test_events = Event.where("start <= ?", params[:end])    
      by_period(test_events)
    end
    def show   
      events = all_events
      events = events.map do |e| 
        curl = {"url" => (event_path(e["id"]))}
        e.merge(curl)
      end
      render json: events
    end
  end 


