# coding: utf-8
class Cpanel::SessionController < Cpanel::ApplicationController
  def create
    if authenticate(params)
      session[:username] = params[:username]
      redirect_to cpanel_url, :notice => "登录成功!"
    else
      redirect_to cpanel_url, :notice => "登录失败!"
    end
  end

  def destroy
    session[:username] = nil
    redirect_to cpanel_url, :notice => '退出成功!'
  end

  private
  def authenticate(params)
    params[:password] = Digest::MD5.hexdigest(params[:password])
    valid_users = [{
      'username' => 'gzhack',
      'password' => "9fe6683ca757d098904aeaad02ec9e0a"
    }]

    valid_users.each do |u|
      return true if params.slice(:username, :password) == u
    end
    false
  end

end
