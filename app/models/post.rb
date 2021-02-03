class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :post_member_relations, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def members
    post_member_relations.map(&:member)
  end
end
