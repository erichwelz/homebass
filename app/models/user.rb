class User < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:first_name, :last_name, :city, :bio, :looking_for]

  has_many :target_references, class_name: "Reference", foreign_key: :target_id
  has_many :source_references, class_name: "Reference", foreign_key: :source_id

  has_many :invitations
  has_many :invitations_received, class_name: "Invitation", foreign_key: :recipient_id

  has_attached_file :avatar, :styles => {
                    :medium => "300x300>",
                    :thumb => "100x100>" }, :default_url => "/images/:attachment/missing_:style.png"

  before_validation :smart_add_url_protocol
  before_validation :upcase_postal
  after_validation :geocode, :if => :postal_code_changed?

  validates_confirmation_of :password

  validates_length_of :password, :minimum => 6, :allow_blank => false, :on => :create
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

  authenticates_with_sorcery!

  geocoded_by :postal_code

  acts_as_taggable
  acts_as_taggable_on :genres, :instruments

  def upcase_postal
    postal_code.upcase! if !postal_code.nil?
  end

  def full_name
    full_name = first_name.capitalize + " " + last_name.capitalize
  end

  def smart_add_url_protocol
    if !personal_url.nil?
      personal_url = "http://#{personal_url}" unless personal_url[/\Ahttps?:\/\//]
    end
  end
end
