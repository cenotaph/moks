class Document < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true    
  attr_accessible :attachable_id, :attachable_type, :name, :user_id, :description, :attachment, :public, :documenttype_id
  mount_uploader :attachment, DocumentUploader
  belongs_to :documenttype

end
