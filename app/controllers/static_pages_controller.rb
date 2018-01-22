class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def index
    if not current_user.actual_deck.nil?
    @card=current_user.cards.where(deck_id:current_user.actual_deck).check_date.first
    if @card.blank?
      redirect_to decks_path, notice:'Нет доступных карточек для просмотра'
    end
     else
      @card=current_user.decks.sample.cards.check_date.first
      if @card.blank?
      redirect_to decks_path, notice:'Нет доступных карточек для просмотра'
    end
    end
  end
  end
