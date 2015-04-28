FactoryGirl.define do

  factory :skill_learn,class: Skill do
    skill_type 'learn'
  end

  factory :skill_teach,class: Skill do
    skill_type 'teach'
  end

  factory :skill_spanish,class: Skill do
    description 'spanish'
  end

  factory :skill_dance,class: Skill do
    description 'dance'
  end
end
