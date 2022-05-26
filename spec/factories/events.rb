FactoryBot.define do
  factory :event do
    title { FFaker::CheesyLingo.title }
    description { FFaker::CheesyLingo.sentence }
    completed { false }
    user
    deadline { FFaker::Time.datetime }
  end


  factory :event_wrong, parent: :event do
    title { nil }
    user { nil }
  end

end
