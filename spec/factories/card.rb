FactoryBot.define do

  factory :card do
    original_text "apple"
    translated_text "яблоко"
  end

  factory :user do
    email "Anton"
    password "qwerty1234"

  end

end