# coding: utf-8
class Cpanel::UsersController < Cpanel::ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to cpanel_users_path, :notice => '删除报名信息成功'
    else
      redirect_to cpanel_users_path, :alert => '删除报名信息失败'
    end

  end
end
