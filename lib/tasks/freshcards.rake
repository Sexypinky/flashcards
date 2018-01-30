task notify_freshcards: :environment do
    User.find_each do |user|
      if user.decks.sample.cards.check_date
      CardsMailer.freshcards(user)
        end
    end
  end
