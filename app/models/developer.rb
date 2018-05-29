class Developer < ApplicationRecord
  has_many :games
  has_many :fans, through: :games
end
