require 'rails_helper'

context "can use flashcards form" do

  before(:each) do
    visit root_path
    fill_in "check_text", with: "Something"
    click_button "Проверить"
  end

  it "right checking card" do
    expect(page).to have_content "Слово переведено неверно"
  end

  it "wrong checking card" do
    expect(page).not_to have_content "Cлово переведено верно"
  end
end
