require 'file_size_validator'
class Attachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
  belongs_to :user, :foreign_key => "user_id"
  validates :file, :presence => true, :file_size => { :maximum => 4.megabytes.to_i }
end
