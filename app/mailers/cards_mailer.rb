class CardsMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def freshcards
    @user = User.find(params[:user_id])
    mail(to: @user.email, subject: 'У вас появились новые карточки для просмотра')
  end

  def send_simple_message
    RestClient.post "https://api:key-008278e423b51e7da1574fe1e240af13"\
  "@api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages",
                    :from => "Excited User <mailgun@YOUR_DOMAIN_NAME>",
                    :to => "bar@example.com, YOU@YOUR_DOMAIN_NAME",
                    :subject => "Hello",
                    :text => "Testing some Mailgun awesomness!"
  end

end