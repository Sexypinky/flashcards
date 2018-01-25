FactoryBot.define do

  factory :deck do
    name "Английский"
  end

  factory :user do
    email "anton@mail.ru"
    password "qwerty1234"
    password_confirmation "qwerty1234"
  end

  factory :card do
    original_text "apple"
    translated_text "яблоко"
    deck
    user
  end


end