class Admin::CardsController <  Admin::AdminController

  def index
    @card=Card.all
  end

  def card_params
    params[:card].permit(:original_text, :translated_text, :review_date, :image, :remove_image, :remote_image_url , :deck)
  end
end