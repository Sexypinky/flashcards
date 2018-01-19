class CardsController < ApplicationController

def index
  @cards=current_user.cards
end

  def new
    @card=Card.new
  end

  def create
    @card=current_user.cards.new(card_params)
    if @card.save
      redirect_to cards_path, notice: 'Карточка успешно создана'
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
      redirect_to cards_path
    else
      render :edit
    end
  end

  def destroy
    @card=Card.find(params[:id])
    if @card.present?
      @card.destroy
      redirect_to cards_path
    else
      redirect_to cards_path,notice:'Ошибка удаления карточки'
    end
  end

  def cardcheck
    @card=Card.find(params[:id])
    if @card.right_translation?(params[:check_text])
      @card.update_review_date
      redirect_to root_path, notice:'Слово переведено верно'
    else
      redirect_to root_path, notice:'Слово переведено неверно'
    end
  end

  def card_params
    params[:card].permit(:original_text, :translated_text, :review_date)
  end
end
