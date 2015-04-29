# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    about {Faker::Lorem.paragraphs}
  end
  factory :alex,class: User do
    name 'alex'
    email 'barretalexandre@hotmail.com'
    password 'password'
  end
  factory :john, class: User do
    name 'john'
    email 'john.kan@virtuosity.co.nz'
    password 'password'
  end
end
