class Events 
  def initialize(end_per, start_per)
    @day = 1.day
    week = 1.week
    month = 1.month
    year = 1.year
    phantom_events = []
    @start_per = start_per
    @end_per = end_per
    
  end
  def make_variables
    @events = Event.where("start >= ? AND start <= ?", @start_per, @end_per) 
    @repeat_events = Event.where.not(repeat: "false").where("start < ?", @fstart_per)
    @events_day_repeat = @repeat_events.where(repeat: "day")
    @events_week_repeat = @repeat_events.where(repeat: "week")
    @events_month_repeat = @repeat_events.where(repeat: "month")
    @events_year_repeat = @repeat_events.where(repeat: "year")
  end
  def make_fantom_events(repeating, events)
    start_period = @start_per
    events.each do  |e| 
      start_period = @start_per
      while start_per <= @end_per do
      e.start = @start_per
      phantom_events << e.attributes 
      start_period + repeating
      end
    end      
  end
  def fulled_coll
    make_fantom_events(@day, @events_day_repeat)
    return phantom_events
  end
end
    