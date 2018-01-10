class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validates :original_text, exclusion: { in: :translated_text}
  before_validation do
    self.original_text=original_text.capitalize
    self.translated_text=translated_text.capitalize
  end

  scope :check_date, -> {where('review_date <= ?', Date.today)}

  before_create :set_review_date

    def set_review_date
    self.review_date=3.days.from_now
    end
  end
