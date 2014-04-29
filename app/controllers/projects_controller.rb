class ProjectsController < ApplicationController
  def index
    @projects = Project.page params[:page]
  end

  def new
    @project = Project.new
    @project.build_demo
  end

  def create
    params[:project][:team] = params[:project][:team].values.join(" ")
    @project = Project.new(project_params)

    fail_msg = t 'activerecord.errors.models.project.failure'
    succ_msg = t 'activerecord.errors.models.project.success'

    begin
      @attachment = @project.build_demo(:file => params[:demo][:file][0]) unless params[:demo].nil?
      @project.save!
      flash[:success] = succ_msg
      redirect_to new_project_path
    rescue ActiveRecord::RecordInvalid => e
      flash[:alert] = "#{fail_msg}<br>#{e.record.errors.full_messages.join('<br >')}"
      @project.build_demo
      render "new"
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :url, :team, :description, :demo_attributes => [:id, :project_id, :file])
  end

end
