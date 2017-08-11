class EventsController < ApplicationController
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


  def index 
  end

  def show
    @acces_user
    @event = Event.find(params[:id])  
    if  @event.user_id == current_user.id
      @acces_user = true
    else
      @acces_user = false
    end
  end

  def new
    @event = Event.new
    @current_user = current_user.id
    @dont_repeat = nil
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
      else
        format.html { render :action => "edit" }      
      end
    end    
  end

  def create
    @current_user = current_user.id
    @current_user = {"user_id" => (@current_user)}
    event_params_save = (event_params).merge(@current_user)
    @event = Event.new(event_params_save)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, :notice => 'Event was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to events_url
  end

  def preview
    @events = Event.where("user_id = ?", current_user.id)
  end

  private

  def event_params
    params.require(:event).permit(:id, :title, :start, :description, :repeat)
  end   
end     
