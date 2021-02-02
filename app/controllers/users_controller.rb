class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @posts = Post.with_attached_image
    @posts = @posts.where(user_id: current_user.id).order(created_at: :DESC)
  end
end