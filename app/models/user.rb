class User < ActiveRecord::Base
  has_one :profile
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  has_many :host_reviews
  has_many :reviews, :through => :host_reviews
  
  has_many :inverse_host_reviews, :class_name => "host_reviews", :foreign_key => "reviewer_id"
  has_many :inverse_reviews, :through => :inverse_host_reviews, :source => :user

  authenticates_with_sorcery!
  
  attr_accessible :username, :email, :password, :password_confirmation, :address_field1, :address_field2, :city, :state, :zipcode, :role, :first_name, :last_name
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create, :message => "Password can't be blank"
  validates_presence_of :email, :on => :create, :message => "Email can't be blank"
  validates_uniqueness_of :email, :on => :create, :message => "This email address is already registered"

  ROLES = %w[admin moderator user]
  
  def role_symbols
    [role.to_sym]
  end

end
