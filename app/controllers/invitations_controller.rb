class InvitationsController < ApplicationController
def create
    event = Event.find(params[:event])
    confirmation = event.invitations.build(attendee_id: current_user.id)
    if confirmation.save
      redirect_to event
    else
      render root_path
    end
  end
end
