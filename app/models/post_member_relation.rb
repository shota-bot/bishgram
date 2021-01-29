class PostMemberRelation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :post
  belongs_to :member
end
