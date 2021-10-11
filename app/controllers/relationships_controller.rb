class RelationshipsController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @user = User.find(params[:follower_id])
    current_user.follow(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).follower
    current_user.unfollow(@user)
  end
end
