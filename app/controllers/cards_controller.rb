class CardsController < ApplicationController
  def show
    @card=Card.all
  end
end
