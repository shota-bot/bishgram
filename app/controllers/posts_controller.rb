class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_post, only: [:show, :edit, :destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :DESC)
  end

  def new
    @posts_member = PostsMember.new
  end

  def create
    @posts_member = PostsMember.new(post_params)

    if @posts_member.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    post = Post.find(params[:id])

    records = PostMemberRelation.where(post_id: params[:id])
    ids = []
    records.each do |record|
      ids << record[:member_id]
    end

    @posts_member = PostsMember.new(image: post.image, text: post.text, member_ids: ids)
  end

  def update
   
     
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
