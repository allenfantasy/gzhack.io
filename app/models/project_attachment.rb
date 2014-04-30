require 'file_size_validator'
class ProjectAttachment < ActiveRecord::Base
  mount_uploader :file, ProjectAttachmentUploader

  belongs_to :project, :foreign_key => "project_id"
  validates :file, :presence => true, :file_size => { :maximum => 1.gigabytes.to_i }
end
