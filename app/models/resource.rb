class Resource < ActiveRecord::Base
  # attr_accessible :event_id, :project_id, :attachment
  belongs_to :event
  belongs_to :project
  mount_uploader :attachment, DocumentUploader
end
