class EventsController < ApplicationController
    before_action :authenticate_user!, except: %i[index]
    
    def index
        @events = Event.all
    end

    def new
      @event = Event.new
    end

    def create
      @event = current_user.events.build(event_params)

      respond_to do |format|
        if @event.save
          format.html { redirect_to events_url, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    def event_params
      params.require(:event).permit(:title, :location, :date, :time, :user_id)
    end
end
