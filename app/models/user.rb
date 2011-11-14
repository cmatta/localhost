class User < ActiveRecord::Base
  has_one :profile

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  has_many :reviews
  has_many :reviewers, :through => :reviews, :source => :user
  has_many :reviewees, :through => :reviews, :source => :user
  
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
  
  def reviews_about(id)
    Review.find_all_by_reviewee_id(id)
  end
  
end
