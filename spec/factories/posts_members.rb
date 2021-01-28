FactoryBot.define do
  factory :posts_member do
    text       {Faker::Lorem.sentence}
    user_id    {1}
    member_ids {["2"]}
  end
end
