authorization do
  role :admin do
    includes [:moderator, :user, :guest]
    has_permission_on :users, to: [:read, :manage]
    has_permission_on :roles, to: [:read, :manage]
  end
  
  role :moderator do
    includes [:user, :guest]
    has_permission_on :users, to: [:read]
    has_permission_on :reviews, to: [:read, :manage]
  end
  
  role :user do
    includes :guest
    has_permission_on :friendships, to: [:create, :delete] do
      if_attribute :user_id => is { user.id }
    end
    has_permission_on :users, to: [:read]
    has_permission_on :users, to: [:manage] do
      if_attribute :id => is { user.id }
    end
    
    has_permission_on :reviews, to: [:show] 
    has_permission_on :reviews, to: [:create]
    has_permission_on :reviews, to: [:manage] do
      if_attribute :reviewer_id => is  { user.id }
    end
  end
  
  role :guest do
    has_permission_on :users, to: [:read, :create]
    has_permission_on :reviews, to: [:show]
  end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end