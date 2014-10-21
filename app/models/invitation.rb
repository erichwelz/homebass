class Invitation < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipient, :foreign_key => "recipient_id", :class_name => "User"
  default_scope -> { order('created_at DESC') }
  validates_presence_of :content, :user_id, :recipient_id
end
