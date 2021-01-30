class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit]

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
    records = @post.post_member_relations
    ids = []
    records.each do |record|
      ids << record[:member_id]
    end
    @members = []
    ids.each do |id|
      @members << Member.find(id)
    end
  end

  def edit
    records = @post.post_member_relations
    ids = []
    records.each do |record|
      ids << record[:member_id]
    end

    @posts_member = PostsMember.new(image: @post.image, text: @post.text, member_ids: ids)
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
  end

  private

  def post_params
    params.require(:posts_member).permit(:image, :text, { member_ids: [] }).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
