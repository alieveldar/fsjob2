class Api::EventsController < ApplicationController
  respond_to :json
  
  def index 	
  end
  def by_period(e, day)

    @phantom_events = []
    cur_time = (params[:start]).to_time
    stop_time = (params[:end]).to_time
    event = e
    step = day
    event.each do |e|
      cur_time = (params[:start]).to_time
      if e.repeat = "day"
        while cur_time < stop_time do
          @phantom_events << e.attributes.merge("start" => cur_time)
          cur_time = cur_time + step
        end
      elsif e.repeat = "week"
        while cur_time <= stop_time do
          @phantom_events << e.attributes.merge("start" => (e.start + step))
          cur_time = cur_time + step          
        end
      elsif e.repeat = "month"
        while cur_time <= stop_time do
          @phantom_events << e.attributes.merge("start" => (e.start + step))
          cur_time = cur_time + step
        end
      elsif e.repeat = "year"
        while cur_time <= stop_time do
          @phantom_events << e.attributes.merge("start" => (e.start + step))
          cur_time = cur_time + step
        end      
      end
    end


      #@phantom_events = @phantom_events.select { |e| e.start >= cur_time }
      return @phantom_events
    end
    def all_events
      day = 1.day
      week = 1.week
      month = 1.month
      year = 1.year
      all_phantom_evens = []
      repeat_events = Event.where.not(repeat: "false").where("start < ?", params[:start])
      events_day_repeat = repeat_events.where(repeat: "day")
      events_week_repeat = repeat_events.where(repeat: "week")
      events_month_repeat = repeat_events.where(repeat: "month")
      events_year_repeat = repeat_events.where(repeat: "year")
      events = Event.where("start >= ? AND start <= ?", params[:start], params[:end]) 
      events_by_period = events.where(repeat: "day")
      events_by_period_current = events.where.not(repeat: "day")
      all_phantom_evens = all_phantom_evens + by_period(events_day_repeat, day)
      all_phantom_evens = all_phantom_evens + by_period(events_week_repeat, week)
      all_phantom_evens = all_phantom_evens + by_period(events_month_repeat, month)
      all_phantom_evens = all_phantom_evens + by_period(events_year_repeat, year)
      all_phantom_evens = all_phantom_evens + by_period(events_by_period, day)
      all_phantom_evens = all_phantom_evens + events_by_period_current
    end
    def show

    #end_per = (params[:end]).to_time
    #start_per = (params[:start]).to_time
    
    #repeat_events = Event.where.not(repeat: "false").where("start < ?", start_per)
    #events_day_repeat = repeat_events.where(repeat: "day")
    #events = by_period(start_per,end_per, events_day_repeat, day)

    events = all_events
    render json: events
  end
end 


