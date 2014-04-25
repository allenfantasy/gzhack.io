module Cpanel::UsersHelper
  def attachments_for(user)
    raw user.attachments.map(&:file).map { |f| link_to_file(f, f.file.filename) }.join(" ")
  end
end
