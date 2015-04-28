FactoryGirl.define do
  factory :rating do
    course_id {Course.all.sample.id}
    rating {rand 5}
    rating_type {['learn','teach'].sample}
  end
end
