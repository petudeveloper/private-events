class EventsController < ApplicationController
    before_action :authenticate_user!, except: %i[index]
    
    def index
        @events = Event.all
    end

    def new
      @event = current_user.events.build
    end

    def create
      @event = current_user.events.build(event_params)
    end

    private
    def event_params
      params.require(:event).permit(:title, :location, :date, :time)
    end
end
