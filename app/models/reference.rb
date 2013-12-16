class Reference < ActiveRecord::Base
  validates_presence_of :comment
  validates_presence_of :feedback_value, message: "rating be selected"

validates :source_id, :uniqueness => { :scope => :target_id, :message => "You may only write one reference per user. You may manage your references from your home page" }

validate :check_self_reference

def check_self_reference
  errors.add(:source_id, "You can't leave a review for yourself") if source_id == target_id
end

  belongs_to :source, :class_name => "User" 
  belongs_to :target, :class_name => "User"

    def feedback_textifier
      case feedback_value
      when 1
        return "Positive"
      when 0
        return "Neutral"
      when -1
        return "Negative"
      end            
    end

end
