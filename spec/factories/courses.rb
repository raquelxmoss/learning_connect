connection = Connection.all.sample

FactoryGirl.define do
  factory :course do
    connection_id {connection.id}
    title {Faker::Lorem.sentence}
    status {Faker::Lorem.paragraph}
    tutor {connection.receiver.id}
    learner {connection.initializer.id}
  end
end
