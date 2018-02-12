class Dashboard::CardsController <  Dashboard::DashboardController

def index
  @deck=current_user.decks.find(params[:format])
end

def show
  @card=Card.find(params[:id])
end

  def new
    if current_user.decks.blank?
      redirect_to dashboard_decks_path, notice: t('flash.firstlymakedeck')
      else
    @card=Card.new
    end
    end

  def create
    @card=current_user.cards.new(card_params)
    if @card.save
      redirect_to dashboard_decks_path, notice: t('flash.succeedmakecard')
    else
      flash.now[:danger]=t('flash.failmakecard')
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
    @card.succeed!(params[:time].to_i)
    @notice = if @card.misspelling?(params[:check_text])
               t('flash.wrongtranslate')+': '+ t('flash.righttrasnlation')+' - ' + @card.original_text+', ' + t('flash.yourvariant')+' - ' + params[:check_text]
             else
               t('flash.righttranslate')
              end
    respond_to do |format|
      format.js
    end
  else
    @card.failed!
    @notice = t('flash.wrongtranslate')
  end
end

  def card_params
    params[:card].permit(:original_text, :translated_text, :next_repetition, :image, :remove_image, :remote_image_url, :deck_id)
  end
end
