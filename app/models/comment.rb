class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true, length: { maximum: 500 }

  def template
    ApplicationController.renderer.render partial: "comments/comment", locals: { comment: self }
  end
end
