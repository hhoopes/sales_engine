FactoryGirl.define do
  factory :customer do
    first_name
    last_name
  end
  factory :merchant do
    name
  end

  sequence :name do |n|
    "name#{n}"
  end

  sequence :first_name do |n|
    "name#{n}"
  end

  sequence :last_name do |n|
    "name#{n}"
  end
end
