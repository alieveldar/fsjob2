class Events
class << self
    def by_period(start_per, end_per, e, day )
      phantom_events = []
      cur_time = start_per
      while cur_time <= period_end do
        phantom_events << e.attributes.mrge("start => cur_time")
        cur_time += day
      end
    end
  end