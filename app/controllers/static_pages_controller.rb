class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @card=current_user.cards.check_date.first
    if @card.blank?
      redirect_to cards_path, notice:'Нет доступных карточек для просмотра'
    end
    end
end
