require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  describe "お気に入り登録" do
    context "お気に入り登録できる" do
      it "ユーザー、投稿に紐づいていれば登録できる" do
        expect(@favorite).to be_valid
      end
    end
    context "お気に入り登録できない" do
      it "ユーザーに紐づいていないと登録できない" do
        @favorite.user = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("ユーザーを入力してください")
      end
      it "投稿に紐づいていないと登録できない" do
        @favorite.post = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("投稿を入力してください")
      end
      it "同じ投稿を複数回登録できない" do
        @favorite.save
        another_favorite = FactoryBot.build(:favorite)
        another_favorite.user = @favorite.user
        another_favorite.post = @favorite.post
        another_favorite.valid?
        expect(another_favorite.errors.full_messages).to include("Postはすでに存在します")
      end
    end
  end
end
