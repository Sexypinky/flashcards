class CardsMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def freshcards
    @user = User.find(params[:user_id])
    mail(to: @user.email, subject: 'У вас появились новые карточки для просмотра')
  end

end