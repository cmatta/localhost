class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      redirect_to users_path, :notice => "Successfully added friend."
    else
      redirect_to users_path, :notice => "Failed to add friend."
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to user_url(current_user), :notice => "Successfully removed friendship."
  end
end
