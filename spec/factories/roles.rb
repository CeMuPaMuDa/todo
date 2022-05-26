FactoryBot.define do
  factory :role do
    sequence(:name) { |n| "name#{n}" }
    sequence(:alias_name) { |n| "code#{n}" }
  end
end
