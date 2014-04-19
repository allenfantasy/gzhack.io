class WorksController < ApplicationController
  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    fail_msg = t 'activerecord.errors.models.work.failure'
    succ_msg = t 'activerecord.errors.models.work.success'

    begin
      @work.save!
      flash[:success] = succ_msg
      redirect_to new_work_path
    rescue ActiveRecord::RecordInvalid => e
      flash[:alert] = "#{fail_msg}<br>#{e.record.errors.full_messages.join('<br >')}"
      render "new"
    end
  end

  private
  def work_params
    params.require(:work).permit(:name, :url, :team, :description)
  end

end
