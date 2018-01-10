class StaticPagesController < ApplicationController
  def index
    @card=Card.check_date.first
    if @card.blank?
      redirect_to cards_index_path, notice:'Нет доступных карточек для просмотра'
    end
    @cardcheck=Card.new
    end
end
