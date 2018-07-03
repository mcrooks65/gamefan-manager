class Fan < ApplicationRecord
  has_one :game
  has_many :developers, through: :games

  validates :name, presence: true
  validates :game_id, presence: true
end
