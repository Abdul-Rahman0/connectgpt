class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def show
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      # Re-render the new form with errors
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      # Re-render the edit form with errors
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  def join
    @event = Event.find(params[:id])
    unless current_user.events.include?(@event)
      current_user.events << @event
      EventParticipation.create(user_id: current_user.id, event_id: @event.id)
    end
    redirect_to @event, notice: 'Successfully joined the event.'
  end


  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :date, :location)
    end
end
