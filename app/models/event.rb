# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  start       :datetime
#  description :text
#  repeat      :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
	class << self
    def by_period(events, start, stop)
      steps = {"day" => 1.day, "week" => 1.week, "month" => 1.month, "year" => 1.year}
      phantom_events = []
      cur_time = start
      stop_time = (stop).to_time
      event = events
      event.each do |e|
        curn_time = (cur_time).to_time
        if e.repeat != ""
          step = steps[e.repeat]
          start_time_event = e.start
          while (curn_time <= stop_time)  do      
            phantom_events << e.attributes.merge("start" => start_time_event)
            start_time_event = start_time_event + step
            curn_time = start_time_event
          end
        else
          phantom_events << e.attributes
        end
        phantom_events = phantom_events.select { |e| e["start"] >= start }
      end

      return phantom_events
    end
    def all_events(start, stop)
      test_events = Event.where("start <= ?", stop)    
      by_period(test_events, start, stop)
    end
  end
end
