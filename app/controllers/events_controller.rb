class EventsController < ApplicationController
 
  def indexjson 
    @events = Event.all
    render :json => @events
  end

  def show
     @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  def new
     @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  def edit
  end

  def create
     @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, :notice => 'Event was successfully created.' }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:id, :allDay, :title, :start, :end, :description, :repeat, :user_id)
  end 
end
