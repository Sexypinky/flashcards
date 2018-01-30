task notify_freshcards: :environment do
    Card.where('review_date <= ?', Date.today) do |card|
      user_id=card.user_id
      CardsMailer.freshcards(user_id)
        end
    end
