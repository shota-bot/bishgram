require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user_1 = FactoryBot.create(:user)
    @user_2 = FactoryBot.create(:user)
    @relationship = Relationship.new(follower_id: @user_1.id, followed_id: @user_2.id)
  end

  describe "フォロー登録" do
    context "フォローできる" do
      it "follower_id, followed_idがあれば登録できる" do
        expect(@relationship).to be_valid
      end
    end
    context "フォローできない" do
      it "follower_idが存在しないと登録できない" do
        @relationship.follower_id = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include("Followerを入力してください")
      end
      it "followed_idが存在しないと登録できない" do
        @relationship.followed_id = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include("Followedを入力してください")
      end
      it "同じユーザーを登録できない" do
        @relationship.save
        another_relationship = Relationship.new(follower_id: @user_1.id, followed_id: @user_2.id)
        another_relationship.valid?
        expect(another_relationship.errors.full_messages).to include("Followerはすでに存在します")
      end
    end
  end
end
