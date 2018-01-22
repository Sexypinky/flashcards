class Deck < ApplicationRecord
  has_many :cards
  belongs_to :user
  validates :name, presence: true
end
