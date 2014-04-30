# coding: utf-8
class Cpanel::ProjectsController < Cpanel::ApplicationController
  def index
    @projects = Project.page params[:page]
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])

    if @project.destroy
      redirect_to cpanel_projects_path, :notice => '删除项目成功'
    else
      redirect_to cpanel_projects_path, :alert => '删除项目失败'
    end
  end

  def new
    @project = Project.new
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
      redirect_to cpanel_projects_path
    rescue ActiveRecord::RecordInvalid => e
      flash[:alert] = "#{fail_msg}<br>#{e.record.errors.full_messages.join('<br >')}"
      @project.build_demo
      render "new"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    params[:project][:team] = params[:project][:team].values.join(" ")
    @project = Project.find(params[:id])

    fail_msg = t 'activerecord.errors.models.project.failure'
    succ_msg = t 'activerecord.errors.models.project.success'

    begin
      @attachment = @project.build_demo(:file => params[:demo][:file][0]) unless params[:demo].nil?
      @project.update_attributes!(project_params)
      flash[:success] = succ_msg
      redirect_to cpanel_projects_path
    rescue ActiveRecord::RecordInvalid => e
      flash[:alert] = "#{fail_msg}<br>#{e.record.errors.full_messages.join('<br >')}"
      @project.build_demo
      render "edit"
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :url, :team, :description, :demo_attributes => [:id, :project_id, :file])
  end
end
