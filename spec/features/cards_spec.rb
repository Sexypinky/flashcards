require 'rails_helper'

context "can use flashcards form" do
  let(:card) {create :card}

  before(:each) do
    visit root_path
  end

  it "right checking card" do
    fill_in "check_text", with: "Something"
    click_button "Проверить"
    expect(page).to have_content "Слово переведено неверно"
  end

  it "wrong checking card" do
    fill_in "check_text", with: "Apple"
    click_button "Проверить"
    expect(page).not_to have_content "Cлово переведено верно"
  end
end
