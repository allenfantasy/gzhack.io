# coding: utf-8
class UsersController < ApplicationController
  def create
    # deal with params
    params[:user][:homepage] = params[:user][:homepage].values.join(" ")
    if params[:user][:user_type] == 'others'
      params[:user][:user_type] = params[:other_type]
    end
    @user = User.new(user_params)

    if @user.save
      redirect_to about_path, :notice => '报名成功！'
    else

      logger.info @user.errors.full_messages
      redirect_to about_path, :alert => "报名失败！<br>#{@user.errors.full_messages.join('<br>')}"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :tel, :organ, :homepage, :user_type, :about)
  end

end

