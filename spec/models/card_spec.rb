require File.dirname(__FILE__) + '/../rails_helper'

describe Card do

  let(:card) { create(:card) }

  it "is eq if set_review_date work" do
    expect(card.review_date.strftime('%m.%d.%Y')).to eq(12.hours.from_now.strftime('%m.%d.%Y'))
  end

  it "is true if right_translation? right" do
    check = card.right_translation?('Apple')
    expect(check).to be_truthy
  end

  it "is true if right_translation? not right" do
    check=card.right_translation?('lol')
    expect(check).to_not be_truthy
  end

  it "is eq if level_up.level is working" do
    card.level_up
    expect(card.level).to eq(1)
  end

  it "is eq if level_up.review_date is working" do
    card.level_up
    expect(card.review_date.strftime('%m.%d.%Y')).to eq(3.days.from_now.strftime('%m.%d.%Y'))
  end

  it "is eq if level_down.review_date is working" do
    card.level_down
    expect(card.review_date.strftime('%m.%d.%Y')).to eq(12.hours.from_now.strftime('%m.%d.%Y'))
  end

  it "is eq if level_down.level is working" do
    card.level_down
    expect(card.level).to eq(0)
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

end