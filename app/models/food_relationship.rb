class FoodRelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :food_exclusions, :class_name => "User", :foreign_key => "food_id"
  belongs_to :food_inclusions, :class_name => "User", :foreign_key => "food_id"
  
  #has_one :food, :foreign_key => "food_id"
  #has_one :user, :foreign_key => "user_id"
end
