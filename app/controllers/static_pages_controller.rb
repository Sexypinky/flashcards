class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def index
    if not current_user.actual_deck.nil?
    @card=current_user.actual_deck.cards.check_date.first
    if @card.blank?
      redirect_to decks_path, notice:'Нет доступных карточек для просмотра'
    end
    end
      if current_user.decks.sample.nil? or current_user.cards.sample.nil?
        redirect_to decks_path, notice:'Нет карточек для просмотра'
      else
        @card=current_user.decks.sample.cards.check_date.first
        if @card.blank?
          redirect_to decks_path, notice:'Нет доступных карточек для просмотра'
        end
      end
  end

  end
