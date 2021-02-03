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
        expect(@comment.errors.full_messages).to include('テキストを入力してください')
      end
      it 'userに紐づいていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      it 'postに紐づいていないと投稿できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Postを入力してください')
      end
      it '100文字以内でないと投稿できない' do
        @comment.text = Faker::Lorem.characters(number: 101)
        @comment.valid?
        expect(@comment.errors.full_messages).to include('テキストは100文字以内で入力してください')
      end
    end
  end
end
