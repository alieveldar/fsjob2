class EventsController < ApplicationController

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
