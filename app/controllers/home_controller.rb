class HomeController < ApplicationController
  def index
  end

  def detail
  end

  def about
    @user = User.new
    @user_attachment = @user.attachments.build
  end
end
