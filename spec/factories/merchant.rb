FactoryGirl.define do
  factory :merchant do
    name { Faker::Company.name }

    factory :merchant_with_items do
      transient do
        items_count 3
      end

      after(:create) do |merchant, evaluator|
        create_list(:item, evaluator.items_count, merchant: merchant)
      end
    end

    factory :merchant_with_invoices do
      transient do
        invoices_count 3
      end

      after(:create) do |merchant, evaluator|
        create_list(:invoice, evaluator.invoices_count, merchant: merchant)
      end
    end
  end
end
