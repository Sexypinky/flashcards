require File.dirname(__FILE__) + '/../rails_helper'

describe Card do
  let(:card) {create :card}

  it "is true if update_review_date work" do
    card.update_review_date
    expect(card.review_date).to eq(Date.today+3.days)
    end

  it "is true if set_review_date work" do
    @card=card.review_date
    if @card.blank?
    expect(card).to_not be_valid
    else
      expect(card).to be_valid
    end
    end

  it "is true if right_translation? right" do
    check = card.right_translation?('Apple')
    expect(check).to be_truthy
  end

  it "is true if right_translation? not right" do
    check=card.right_translation?('lol')
    expect(check).to_not be_truthy
  end

  it "is eq if set_user_id is work" do
    card.set_user_id
    expect(card.user_id).to eq(current_user.id)
  end

end
