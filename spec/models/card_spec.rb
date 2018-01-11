require File.dirname(__FILE__) + '/../rails_helper'

describe Card do
  let(:card) {create :card}

  it "should be valid" do
    expect(card).to be_valid
  end

  it "is not valid without original_text and tranlsated_text" do
    card.original_text=''
    card.translated_text=''
    expect(card).to_not be_valid
  end

  it "is not valid without a original_text " do
    card.translated_text='Anton'
    card.original_text=''
    expect(card).to_not be_valid
  end

  it "is not valid without a translated_text " do
    card.original_text='Anton'
    card.original_text=''
    expect(card).to_not be_valid
  end

  it "is valid without incorrect input " do
    card.original_text='fAtHer'
    card.translated_text='FuThEr'
    expect(card).to be_valid
  end

  it "is not valid with numbers in translated_text" do
    card.translated_text='122'
    expect(card).to_not be_valid
  end

  it "is not valid with numbers in original_text" do
    card.original_text='122'
    expect(card).to_not be_valid
  end

  it "is not valid with numbers in both" do
    card.original_text='122'
    card.translated_text='122'
    expect(card).to_not be_valid
  end

  it "is true if set_review_date work" do
    @card=card.review_date
    if @card.blank?
    expect(card).to_not be_valid
    end
    end

  it "is true if check_date work" do
    card.review_date=Date.today
    expect(card.check_date).to be_true
  end
end
