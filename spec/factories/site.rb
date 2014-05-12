FactoryGirl.define do
  factory :site do
    sequence(:name) {|n| "site#{n}" }
    sequence(:token)  {|n| "token#{n}" }
  end
end
