module Cpanel::ApplicationHelper
  def user_signed_in?
    session[:username].present?
  end

  def link_to_file(f, name) # f: CarrierWave::AttachmentUploader
    link_to name, f.url, :target => "_blank"
  end
end
