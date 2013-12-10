class Reference < ActiveRecord::Base
  validates_presence_of :comment

  belongs_to :source, :class_name => "User" 
  belongs_to :target, :class_name => "User"
end
