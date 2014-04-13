class HomeController < ApplicationController
  def index
    render layout: 'homepage'
  end

  def detail
  end

  def about
  end

  def signup
    @user = User.new
    @user_attachment = @user.attachments.build
  end
end
