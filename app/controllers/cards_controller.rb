class CardsController < ApplicationController
  def index
    @card=Card.all
  end

  def new
    @card=Card.new
  end

  def create
    @card=Card.new(card_params)
    if @card.save
      redirect_to cards_index_path, notice: 'Карточка успешно создана'
    else
      flash.now[:danger]='Ошибка создания карточки'
      render :new
    end
  end

  def edit
    @card=Card.find(params[:id])
  end

  def update
    @card=Card.find(params[:id])
    if @card.update(card_params)
      redirect_to cards_index_path
    else
      render :edit
    end
  end

  def destroy
    @card=Card.find(params[:id])
    if @card.present?
      @card.destroy
      redirect_to cards_index_path
    else
      flash.now[:danger]='Ошибка удаления карточки'
      redirect_to cards_index_path
    end
  end

  def cardcheck
    @cardcheck=Card.new(card_params)
    @card=Card.find_by(original_text: @cardcheck.translated_text)
    if not @card.blank?
      @card.update(:review_date => 3.days.from_now)
      redirect_to root_path, notice:'Слово переведено верно'
    else
      redirect_to root_path, notice:'Слово переведено неверно'
    end
  end

  def card_params
    params[:card].permit(:original_text, :translated_text, :review_date)
  end
end
