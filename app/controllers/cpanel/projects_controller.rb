# coding: utf-8
class Cpanel::ProjectsController < Cpanel::ApplicationController
  def index
    @projects = Project.all
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
end
