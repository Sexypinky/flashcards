class DecksController < ApplicationController

  def index
    @deck=current_user.decks
  end

  def new
    @deck=Deck.new
  end

  def create
    @deck=current_user.decks.new(deck_params)
    if @deck.save
      redirect_to decks_path, notice: 'Колода успешно создана'
    else
      flash.now[:danger]='Ошибка создания колоды'
      render :new
    end
  end

  def edit
    @deck=Deck.find(params[:id])
  end

  def update
    @deck=Deck.find(params[:id])
    if @deck.update(deck_params)
      redirect_to decks_path
    else
      render :edit
    end
  end


  def destroy
    @deck=Deck.find(params[:id])
    if @deck.present?
      if current_user.actual_deck == @deck.id
        current_user.update_attribute(:actual_deck, nil)
      end
      @deck.destroy
      redirect_to decks_path
    else
      redirect_to edit_deck_path,notice:'Ошибка удаления карточки'
    end
  end

  def actualdeck
    current_user.update_attribute(:actual_deck, params[:format])
    redirect_to decks_path, notice:'Текущая колода успешно изменена'
  end

  def deck_params
    params[:deck].permit(:name)
  end
end
