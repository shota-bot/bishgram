require 'rails_helper'

RSpec.describe PostsMember, type: :model do
  before do
    @posts_member = FactoryBot.build(:posts_member)
    @posts_member.image = fixture_file_upload('public/images/test_image.png')
  end

  describe "写真を投稿する" do
    context "投稿できる" do
      it "image, text, member_idが存在すれば投稿できる" do
        expect(@posts_member).to be_valid
      end
      it "textがなくても投稿できる" do
        @posts_member.text = ""
        expect(@posts_member).to be_valid
      end
      it "member_idsが複数存在しても投稿できる" do
        @posts_member.member_ids = ["2","3","4"]
        expect(@posts_member).to be_valid
      end
    end

    context "投稿できない" do
      it "imageが空だと投稿できない" do
        @posts_member.image = nil
        @posts_member.valid?
        expect(@posts_member.errors.full_messages).to include("Image can't be blank")
      end
      it "member_idsが空だと投稿できない" do
        @posts_member.member_ids = []
        @posts_member.valid?
        expect(@posts_member.errors.full_messages).to include("Member ids can't be blank")
      end
      it "user_idが空だと投稿できない" do
        @posts_member.user_id = nil
        @posts_member.valid?
        expect(@posts_member.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
