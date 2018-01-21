class Card < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :deck
  validates :original_text, :translated_text,  presence: true
  validates :original_text, exclusion: { in: :translated_text}
  validates :original_text, :translated_text, :format => { :without =>/[0-9]/,
                             :message => "Только буквы!" }
  before_validation do
    self.original_text=original_text.capitalize
    self.translated_text=translated_text.capitalize
  end

  scope :check_date, -> {where('review_date <= ?', Date.today)}

  def update_review_date
  self.update(:review_date => 3.days.from_now)
  end

  def right_translation?(params)
    self.original_text==(params)
  end

  before_create :set_review_date

    def set_review_date
    self.review_date=3.days.from_now
    end

  end
