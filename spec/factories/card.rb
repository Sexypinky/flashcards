FactoryBot.define do

  factory :card do
    original_text "apple"
    translated_text "яблоко"
  end

  factory :deck do
    name "Английский"
  end

  factory :user do
    email "Anton"
    password "qwerty1234"

  end

end