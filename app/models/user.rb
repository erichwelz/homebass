class User < ActiveRecord::Base
  authenticates_with_sorcery!

  acts_as_taggable


  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :city 
  validates_presence_of :postal_code

  validates :email, uniqueness: true

  def full_name
    full_name = first_name.capitalize + " " + last_name.capitalize 
  end 


end
