class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def events
    @events = @user.events
  end

  def show_events
    @event = Event.find(params[:id])
  end

  private

  def set_user
    @user = current_user
  end
end
