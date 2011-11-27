class User < ActiveRecord::Base
  
  has_one :profile
  
  has_many :assignments
  has_many :roles, :through => :assignments
  
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  has_many :reviews
  has_many :reviews_written, :class_name => "Review", :foreign_key => 'reviewer_id'
  has_many :reviews_about, :class_name => "Review", :foreign_key => 'reviewee_id'

  has_attached_file :profilepic, 
      styles: { small: "100x100>", medium: "300x300>"}
  
  attr_accessible :username, :email, :password, 
    :password_confirmation, :address_field1, :address_field2, 
    :city, :state, :zipcode, :first_name, :last_name, :profilepic,
    :profilepic_file_name, :role_ids
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create, :message => "Password can't be blank"
  validates_presence_of :email, :on => :create, :message => "Email can't be blank"
  validates_uniqueness_of :email, :on => :create, :message => "This email address is already registered"
  
  authenticates_with_sorcery!
  
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
  
  def rating
    # Returns an average user rating based on 
    # rating input, converts it to a 1-20 scale
    if self.reviews_about.nil?
      return 0
    else
      reviews = self.reviews_about
      totalscore = 0
      reviews.each do |review|
        totalscore += review.rating
      end
      return totalscore if totalscore == 0
      return ((totalscore.to_f/reviews.length)*4).to_i
    end
  end
  
end
