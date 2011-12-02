class User < ActiveRecord::Base
  
  has_one :profile
  
  has_many :assignments, :dependent => :destroy
  has_many :roles, :through => :assignments
  
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id", :dependent => :destroy
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  has_many :reviews
  has_many :reviews_written, :class_name => "Review", :foreign_key => 'reviewer_id'
  has_many :reviews_about, :class_name => "Review", :foreign_key => 'reviewee_id'
  
  has_many :food_relationships
 
  has_many :food_exclusions, :through => :food_relationships, :class_name => "Food", :foreign_key => "user_id", :conditions => ["inclusion = ?", false] 
  has_many :food_inclusions, :through => :food_relationships, :class_name => "Food", :foreign_key => "user_id", :conditions => ["inclusion = ?", true] 

  attr_accessible :email
  
  after_create :create_role
  
  # validates_confirmation_of :password
  #   validates_presence_of :password, :on => :create, :message => "Password can't be blank"
  # validates_presence_of :email, :on => :create, :message => "Email can't be blank"
  #   validates_uniqueness_of :email, :on => :create, :message => "This email address is already registered"
  
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
  
  def self.create_with_omniauth(auth)
    if auth["info"]["location"]
      location = auth["info"]["location"]
      (city, state) = location.split(/,/)
      city = city.strip
      state = state.strip
    end
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.city = city
      user.state = state
      user.facebook_url = auth["info"]["urls"]["Facebook"]
      user.gender = auth["extra"]["raw_info"]["gender"] 
    end
  end
  
  def create_role
    Assignment.create :user => self, :role => Role.find_by_name("user")
  end
  
end
