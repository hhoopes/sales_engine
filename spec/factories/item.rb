FactoryGirl.define do
  factory :item do
    name "MyString"
    description "MyString"
    unit_price Random.rand(99..5000)
    merchant
  end
end
