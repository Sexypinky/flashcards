class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validates :original_text, exclusion: { in: :translated_text}
  before_validation do
    self.original_text=original_text.capitalize
    self.translated_text=translated_text.capitalize
  end

  before_create :set_review_date
    def set_review_date
    @review=Date.today
    self.review_date=@review.next_day(3)
  end
  end
