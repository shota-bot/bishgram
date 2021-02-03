class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.with_attached_image
    @posts = @posts.where(user_id: @user.id).order(created_at: :DESC)
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_list = Post.with_attached_image.find(favorites).sort! { |a| a[:created_at] }
    @followers = Relationship.where(follower_id: @user.id)
    @followeds = Relationship.where(followed_id: @user.id)
  end
end
