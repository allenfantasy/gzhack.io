class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    fail_msg = t 'activerecord.errors.models.project.failure'
    succ_msg = t 'activerecord.errors.models.project.success'

    begin
      @project.save!
      flash[:success] = succ_msg
      redirect_to new_project_path
    rescue ActiveRecord::RecordInvalid => e
      flash[:alert] = "#{fail_msg}<br>#{e.record.errors.full_messages.join('<br >')}"
      render "new"
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :url, :team, :description)
  end

end
