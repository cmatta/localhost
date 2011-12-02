class Food < ActiveRecord::Base
  
  belongs_to :food_relationship, :foreign_key => "food_id"
end
