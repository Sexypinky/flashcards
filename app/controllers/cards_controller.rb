class CardsController < ApplicationController

def index
  @deck=current_user.decks.find(params[:format])
end

def show
  @card=Card.find(params[:id])
end

  def new
    if current_user.decks.blank?
      redirect_to decks_path, notice:'Сначал создайте колоду'
      else
    @card=Card.new
    end
    end

  def create
    @card=current_user.cards.new(card_params)
    if @card.save
      redirect_to decks_path, notice: 'Карточка успешно создана'
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
      redirect_to cards_path(@card.deck_id)
    else
      render :edit
    end
  end

  def destroy
    @card=Card.find(params[:id])
      @card.destroy
      redirect_to cards_path(@card.deck.id)
    end

  def cardcheck
    @card=Card.find(params[:id])
    if @card.right_translation?(params[:check_text])
      @card.level_up
      if Levenshtein.distance(params[:check_text], @card.original_text) == 1
        @misspelling='Слово переведенно с опечаткой, оригинал: '+ @card.original_text + ', Ваш вариант: ' + params[:check_text]
        redirect_to root_path, notice: @misspelling
      else
      redirect_to root_path, notice:'Слово переведено верно'
      end
    else
      unless @card.try==2
        @card.tryplus
      redirect_to root_path, notice:'Слово переведено неверно'
      else
        redirect_to root_path, notice:'Кол-во попыток исчерпано, смена слова'
      @card.level_down
      @card.tryzero
        end
    end
  end

  def card_params
    params[:card].permit(:original_text, :translated_text, :review_date, :image, :remove_image, :remote_image_url, :deck_id)
  end
end
