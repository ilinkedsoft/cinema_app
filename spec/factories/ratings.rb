FactoryBot.define do
  factory :rating do
    association :movie

    stars { 4 }
  end
end
