class Card < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :deck
  validates :original_text, :translated_text,   presence: true
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

  def tryplus
    self.update(:try => self.try+1)
  end

  def level_up
    case
      when self.level == 1
        self.update(:review_date => 3.days.from_now, :level => 2)
      when self.level == 2
        self.update(:review_date => 7.days.from_now, :level => 3)
      when self.level == 3
        self.update(:review_date => 14.days.from_now, :level => 4)
      when self.level == 4
        self.update(:review_date => 1.month.from_now, :level => 5)
      when self.level == 5
        self.update(:review_date => 10.years.from_now)
    end
  end

  def level_down
    self.update(:review_date => 12.hours.from_now)
  end

  before_create :set_review_date

    def set_review_date
    self.review_date=12.hours.from_now
    end

  end
