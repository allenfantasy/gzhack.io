class ProjectAttachment < ActiveRecord::Base
  mount_uploader :file, ProjectAttachmentUploader

  belongs_to :project, :foreign_key => "project_id"
end
