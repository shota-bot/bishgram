class PostMemberRelation < ApplicationRecord
  belongs_to :post
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :member
end
