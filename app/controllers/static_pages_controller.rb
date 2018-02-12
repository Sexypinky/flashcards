class  StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def index
    if not current_user.actual_deck.nil?
    @card=current_user.actual_deck.cards.check_date.first
    if @card.blank?
      redirect_to dashboard_decks_path, notice:t('flash.nocardsincurrentdeck')
    end
    end
      if current_user.decks.sample.nil? or current_user.cards.sample.nil?
        redirect_to dashboard_decks_path, notice:t('flash.nocards')
      else
        @card=current_user.decks.sample.cards.check_date.first
        if @card.blank?
          redirect_to dashboard_decks_path, notice:t('flash.nopendingcards')
        end
      end
  end

  end
