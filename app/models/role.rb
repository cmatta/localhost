class Role < ActiveRecord::Base
  using_access_control
  
  has_many :assignments
  has_many :users, :through => :assignments
end
