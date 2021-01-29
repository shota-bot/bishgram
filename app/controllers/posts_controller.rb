class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :DESC)
  end

  def new
    @posts_member = PostsMember.new
  end

  def create
    @posts_member = PostsMember.new(post_params)
    if @posts_member.valid?
      @posts_member.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def post_params
    params.require(:posts_member).permit(:image, :text, { member_ids: [] }).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
