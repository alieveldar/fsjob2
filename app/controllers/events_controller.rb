class EventsController < ApplicationController
  
  def indexjson 
    #@events = Event.all
    #render :json => @events
  end

  def show
   @event = Event.find(params[:id])   
   
  end

  def new
   @event = Event.new
   @current_user = current_user.id
  end

  def edit
  end

  def create
   @current_user = current_user.id
   @current_user = {"user_id" => (@current_user)}
   event_params_save = (event_params).merge(@current_user)
   @event = Event.new(event_params_save)
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
  params.require(:event).permit(:id, :allDay, :title, :start, :description, :repeat)

end   
end     
