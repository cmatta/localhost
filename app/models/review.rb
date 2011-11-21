class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :reviewer, :class_name => "User", :foreign_key => "reviewer_id"
  belongs_to :reviewee, :class_name => "User", :foreign_key => "reviewee_id"

  attr_accessible :reviewer_id, :reviewee_id, :title, :body, :rating
  
  def self.reviewee
    User.find_by_id(:reviewee_id)
  end
  
  def self.reviewer
    User.find_by_id(:reviewer_id)
  end
  
    
end
