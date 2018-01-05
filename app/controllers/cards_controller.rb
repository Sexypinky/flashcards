class CardsController < ApplicationController
  def show
    @card=Card.all
  end

  def new
    @card=Card.new
  end

  def create
    @card=Card.new(card_params)
    if @card.save
      redirect_to cards_path, notice: 'Страница успешно создана'
    else
      flash.now[:danger]='Ошибка создания страницы'
      render :new
    end
  end

  def edit
    @card=Card.find(params[:format])
  end

  def update
    @card=Card.find(params[:format])
    if @card.update(card_params)
      redirect_to cards_path
    else
      render :edit
    end
  end
  def destroy
    @card=Card.find(params[:format])
    if @card.present?
      @card.destroy
      redirect_to cards_path
    else
      flash.now[:danger]='Ошибка удаления страницы'
      redirect_to cards_path
    end
  end
  def card_params
    params[:card].permit(:original_text, :translated_text, :review_date)
  end
end
