class Card < ApplicationRecord
  include Repetition
  mount_uploader :image, ImageUploader
  belongs_to :deck
  belongs_to :user
  validates :original_text, :translated_text,   presence: true
  validates :original_text, exclusion: { in: :translated_text}
  validates :original_text, :translated_text, :format => { :without =>/[0-9]/,
                                                           :message => "Только буквы!" }
  before_validation do
    self.original_text=original_text.capitalize
    self.translated_text=translated_text.capitalize
  end

  scope :check_date, -> {where('next_repetition <= ?', Date.today)}

  def succeed!(params)
    if params>10
      self.set_next_repetition_date
    else
    mark = case params
      when 1..5
        5
      when 5..10
        4
           end
    self.process_recall_result(mark)
    end
    self.save
  end

  def failed!
    unless self.try==2
      self.tryplus
    else
      self.set_next_repetition_date
      self.save
      self.tryzero
    end
  end

  def misspelling?(params)
    Levenshtein.distance(params, self.original_text) == 1
  end

  def right_translation?(params)
    self.original_text==params or self.misspelling?(params)
  end

  def tryplus
    self.update(try: self.try+1)
  end

  def tryzero
    self.update(try: 0)
  end

  before_create :set_next_repetition_date

  def set_next_repetition_date
    self.next_repetition=1.days.from_now
  end

end