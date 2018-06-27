class Fan < ApplicationRecord
  has_one :game
  has_many :developers, through: :games
end
