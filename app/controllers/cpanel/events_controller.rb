class Cpanel::EventsController < Cpanel::ApplicationController
  def index
    @events = Event.all
  end
end
