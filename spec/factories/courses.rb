FactoryGirl.define do
  factory :course do
    title {Faker::Lorem.sentence}
    status {Faker::Lorem.paragraph}
  end
end
