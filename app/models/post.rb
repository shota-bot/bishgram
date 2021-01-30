class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :post_member_relations, dependent: :destroy
  has_many :members, through: :post_member_relations
end
