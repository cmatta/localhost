class User < ActiveRecord::Base
  has_one :profile
  authenticates_with_sorcery!
  
  attr_accessible :username, :email, :password, :password_confirmation, :address_field1, :address_field2, :city, :state, :zipcode, :role
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create, :message => "Password can't be blank"
  validates_presence_of :email, :on => :create, :message => "Email can't be blank"
  validates_uniqueness_of :email, :on => :create, :message => "This email address is already registered"

  ROLES = %w[admin moderator user]
  
  def role_symbols
    [role.to_sym]
  end

end
