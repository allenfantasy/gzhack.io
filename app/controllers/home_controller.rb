class HomeController < ApplicationController
  has_mobile_fu

  def index
    render layout: 'homepage' unless is_mobile_device?
  end

  def detail
  end

  def about
  end

  def signup
    @user = User.new
    @user_attachment = @user.attachments.build
  end

  def sponsors
  end

  def partners
  end

  def colleges
  end
end
