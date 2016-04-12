FactoryGirl.define do
  factory :invoice_item do
    item nil
    invoice nil
    quantity 1
    unit_price 1
  end
  factory :transaction do
    invoice nil
  end
  factory :item do
    name "MyString"
    description "MyString"
    unit_price 1
    merchant_id nil
  end
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
