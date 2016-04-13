FactoryGirl.define do
  factory :transaction do
    result "success"
    invoice
  end
end
