class Staffcomment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  # attr_accessible :user_id, :comment, :commentable_type, :commentable_id
  validates_presence_of :user_id, :comment, :commentable_type, :commentable_id
end
