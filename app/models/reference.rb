class Reference < ActiveRecord::Base
  validates_presence_of :comment
  validates_presence_of :feedback_value

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
