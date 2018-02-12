class Dashboard::DecksController <  Dashboard::DashboardController

  def index
    @deck=current_user.decks
  end

  def new
    @deck=Deck.new
  end

  def create
    @deck=current_user.decks.new(deck_params)
    if @deck.save
      redirect_to dashboard_decks_path, notice: t('flash.succeedmakedeck')
    else
      flash.now[:danger]=t('flash.failmakedeck')
      render :new
    end
  end

  def edit
    @deck=Deck.find(params[:id])
  end

  def update
    @deck=Deck.find(params[:id])
    if @deck.update(deck_params)
      redirect_to dashboard_decks_path
    else
      render :edit
    end
  end


  def destroy
    @deck=Deck.find(params[:id])
      if current_user.actual_deck == @deck.id
        current_user.update_attribute(:actual_deck, nil)
      end
      @deck.cards.destroy
      @deck.destroy
      redirect_to dashboard_decks_path
    end

  def actualdeck
    current_user.update_attribute(:actual_deck, params[:id])
    redirect_to dashboard_decks_path, notice:t('flash.changecurrentdeck')
  end

  def deck_params
    params[:deck].permit(:name)
  end
end
