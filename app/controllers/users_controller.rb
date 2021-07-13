class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = current_user
    else
    @user = User.find(params[:id])
    end
    @created_events = @user.events
    @past_events = current_user.events.past_events
    @upcoming_events = current_user.events.future_events
  end
end
