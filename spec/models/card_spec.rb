require 'rails_helper'h

describe Card do

  let(:card) { create(:card) }

  it "is eq if set_next_repetition_date working" do
    expect(card.next_repetition.strftime('%m.%d.%Y')).to eq(1.day.from_now.strftime('%m.%d.%Y'))
  end
  
  it "is true if right_translation? right" do
    check = card.right_translation?('Apple')
    expect(check).to be_truthy
  end

  it "is true if right_translation? not right" do
    check=card.right_translation?('lol')
    expect(check).to_not be_truthy
  end

  it "is eq if tryplus is working" do
    card.tryplus
    expect(card.try).to eq(1)
  end

  it "is eq if tryzero is working" do
    card.tryplus
    card.tryzero
    expect(card.try).to eq(0)
  end

  it "is true if card.misspelling? is working" do
    check=card.misspelling?('Appleq')
    expect(check).to be_truthy
  end

  it "is true if card.misspelling? is not working" do
    check=card.misspelling?('Appleqqq')
    expect(check).to be_falsey
  end

  it "is eq if succeed! is working" do
    check=card.succeed!(4)
    expect(check).to eq(5)
  end

  it "is eq if failed! is working" do
    card.update(try: 3)
    card.failed!
    expect(card.next_repetition.strftime('%m.%d.%Y')).to eq(1.day.from_now.strftime('%m.%d.%Y'))
  end



end