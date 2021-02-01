class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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
    @member_names = @post.members.map{ |hash| hash[:name] }
  
    # コメント一覧表示用
    @comments = @post.comments.includes(:user).order(:id)
    # コメント投稿用
    @comment = current_user.comments.build
  end

  def edit
    member_ids = @post.members.map{ |hash| hash[:id] }

    @posts_member = PostsMember.new(image: @post.image, text: @post.text, member_ids: member_ids)
  end

  def update
    @posts_member = PostsMember.new(post_params)

    if @posts_member.valid?
      @posts_member.update(params[:id])
      redirect_to post_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:posts_member).permit(:image, :text, { member_ids: [] }).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @post.user_id
  end
end
