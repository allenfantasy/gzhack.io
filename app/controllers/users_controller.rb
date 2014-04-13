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
      params[:attachments]['file'].each do |a|
        @attachment = @user.attachments.create!(:file => a, :user_id => @user.id)
      end if params[:attachments]
      flash[:success] = '报名成功！'
      redirect_to signup_path
    else

      logger.info @user.errors.full_messages
      redirect_to signup_path, :alert => "报名失败！<br>#{@user.errors.full_messages.join('<br>')}"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :organ, :homepage, :user_type, :about, :attachments_attributes => [:id, :user_id, :file])
  end

end

