class User < ActiveRecord::Base
  has_many :target_references, class_name: "Reference", foreign_key: :target_id
  has_many :source_references, class_name: "Reference", foreign_key: :source_id
  
  authenticates_with_sorcery!

  acts_as_messageable :required   => :body
     # :required   => :body                  # default [:topic, :body]
     # :class_name => "CustomMessages"       # default "ActsAsMessageable::Message",
     # :dependent  => :destroy               # default :nullify
     # :group_messages => true               # default false

  geocoded_by :postal_code

  acts_as_taggable
  acts_as_taggable_on :genres, :instruments

  validates_confirmation_of :password

  validates_length_of :password, :minimum => 6, :allow_blank => false
  validates_length_of :first_name, :maximum => 35, :allow_blank => false
  validates_length_of :last_name, :maximum => 35, :allow_blank => false

  validates_presence_of :city 
  validates_presence_of :postal_code
  validates_presence_of :genre_list
  validates_presence_of :instrument_list

  validates_format_of :first_name, :with => /[a-z]/
  validates_format_of :last_name, :with => /[a-z]/
  validates_format_of :city, :with => /[a-z]/  
  validates_format_of :postal_code, :with => /\A[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ -]?\d{1}[A-Z]{1}\d{1}\z/

  validates_uniqueness_of :email

  before_validation :upcase_postal
  after_validation :geocode, :if => :postal_code_changed?

  def upcase_postal
    self.postal_code.upcase!
  end

  def full_name
    full_name = first_name.capitalize + " " + last_name.capitalize 
  end     
end
