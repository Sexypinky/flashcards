require File.dirname(__FILE__) + '/../spec_helper'

RSpec.describe Card do
  let(:card) {create :card}

  it "should be valid" do
    @card.should be_valid
  end

end
