FactoryGirl.define do
  factory :transaction do
    result Random.rand(0..1)
    invoice
  end
end
