class PostsMember
  include ActiveModel::Model
  attr_accessor :image, :text, :member_ids, :user_id

  with_options presence: true do
    validates :image
    validates :member_ids
    validates :user_id
  end
  

  def save
    post = Post.create(text: text, image: image, user_id: user_id)

    member_ids.each do |member_id|
      member_id.to_i
      PostMemberRelation.create(post_id: post.id, member_id: member_id)
    end
  end

end