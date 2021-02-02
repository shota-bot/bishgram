require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できる' do
      it 'textが存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿できない' do
      it 'textがないと投稿できない' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userに紐づいていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'postに紐づいていないと投稿できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Post must exist")
      end
      it '100文字以内でないと投稿できない' do
        @comment.text = Faker::Lorem.characters(number: 101)
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text is too long (maximum is 100 characters)")
      end
    end
  end

end
