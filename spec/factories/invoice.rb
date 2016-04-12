FactoryGirl.define do
  factory :invoice do
    status Random.rand(0..1)
  end
end
