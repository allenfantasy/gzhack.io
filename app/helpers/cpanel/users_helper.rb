module Cpanel::UsersHelper
  def attachments_for(user)
    raw user.attachments.map(&:file).map { |f| link_to_file(f) }.join(" ")
  end

  def link_to_file(f) # f: CarrierWave::AttachmentUploader
    link_to f.file.filename, f.url, :target => "_blank"
  end
end
