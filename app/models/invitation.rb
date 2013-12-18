class Invitation < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipient, :foreign_key => "recipient_id", :class_name => "User"

	validates_presence_of :subject
  	validates_presence_of :content

    scope :by_newest, order("created_at DESC")
    default_scope by_newest		
end
