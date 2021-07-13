class UsersController < ApplicationController
  def show
    @user = if user_signed_in?
              current_user
            else
              User.find(params[:id])
            end
    @created_events = @user.events
    @past_events = current_user.events.past_events
    @upcoming_events = current_user.events.future_events

    @past_invitaions = current_user.attended_events.past_events
    @future_invitations = current_user.attended_events.future_events
  end
end
