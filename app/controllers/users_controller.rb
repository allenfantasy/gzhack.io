# coding: utf-8
class UsersController < ApplicationController
  def create
    # deal with params
    params[:user][:homepage] = params[:user][:homepage].values.join(" ")
    params[:user][:user_type] ||= params[:other_type] unless User::TYPES.keys.include? params[:user][:user_type]

    @user = User.new(user_params)

    blacklist = %w(js sh)

    fail_msg = t 'activerecord.errors.models.user.failure'
    succ_msg = t 'activerecord.errors.models.user.success'

    if @user.save
      begin
        params[:attachments]['file'].each do |a|
          @attachment = @user.attachments.create!(:file => a, :user_id => @user.id)
        end if params[:attachments]
        flash[:success] = succ_msg
      rescue ActiveRecord::RecordInvalid => e
        @user.delete
        flash[:alert] = "#{fail_msg}<br>#{e.record.errors.full_messages.join('<br >')}"
        ftype = params[:attachments][:file][0].original_filename
        blacklist.each do |key|
          flash[:alert] = "#{fail_msg}<br>黑客大大求别黑TuT" if /\.#{key}$/ =~ ftype
        end
        return render_signup
      end
    else
      logger.info @user.errors.full_messages
      flash[:alert] = "#{fail_msg}<br>#{@user.errors.full_messages.join('<br>')}"
      return render_signup
    end

    redirect_to signup_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :organ, :homepage, :user_type, :about, :attachments_attributes => [:id, :user_id, :file])
  end

  def render_signup
    @user_attachment = @attachment || @user.attachments.build
    render 'home/signup'
  end
end

