# coding: utf-8
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

    if @event.save
      redirect_to cpanel_events_path, :notice => '创建活动成功'
    else
      redirect_to cpanel_events_path, :alert => '创建活动失败'
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to cpanel_events_path, :notice => '更新活动成功'
    else
      redirect_to cpanel_events_path, :alert => '更新活动失败'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to cpanel_events_path, :notice => '删除活动成功'
    else
      redirect_to cpanel_events_path, :alert => '删除活动失败'
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :time, :body, :prices)
  end
end
