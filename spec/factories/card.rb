FactoryBot.define do

  factory :deck do
    name "Английский"
    user
  end

  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "qwerty1234"
    password_confirmation "qwerty1234"
  end

  factory :card do
    original_text "apple"
    translated_text "яблоко"
    user
    deck
  end

end