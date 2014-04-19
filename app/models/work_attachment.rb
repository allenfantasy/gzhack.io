class Attachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
  belongs_to :work, :foreign_key => "work_id"
  validates :file, :presence => true, :file_size => { :maximum => 4.megabytes.to_i }
end
