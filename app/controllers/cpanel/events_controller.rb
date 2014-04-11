class Cpanel::EventsController < Cpanel::ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
  end

  def update
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :time, :body, :prices)
  end
end
