class Attachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
  belongs_to :user, :foreign_key => "user_id"
end
