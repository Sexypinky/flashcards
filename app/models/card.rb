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


  def right_translation?(params)
    self.original_text==(params)
  end

  def tryplus
    self.update(try: self.try+1)
  end

  def tryzero
    self.update(try: 0)
  end

  def level_up
    a=case
      when self.level == 0
        3.days.from_now
      when self.level == 1
        7.days.from_now
      when self.level == 2
        14.days.from_now
      when self.level == 3
        1.month.from_now
      when self.level == 4
       10.years.from_now
      end
    update(review_date: a, level: self.level+1)
  end

  def level_down
    self.update(review_date: 12.hours.from_now)
  end

  before_create :set_review_date

    def set_review_date
    self.review_date=12.hours.from_now
    end

  end
