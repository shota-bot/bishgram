class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_list = Post.with_attached_image.find(favorites).sort! { |a| a[:created_at] }
  end
end
