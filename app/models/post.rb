class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :post_member_relations, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :members, through: :post_member_relations
end
