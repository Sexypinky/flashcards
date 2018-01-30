namespace :user do

  task notify_freshcards: :environment do
    User.where("decks.sample.cards.check_date == ?", true).each do |user|
      CardsMailer.delay.freshcards(user)
    end
  end

end