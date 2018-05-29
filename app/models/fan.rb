class Fan < ApplicationRecord
  has_many :games
  has_many :developers, through: :games
end
