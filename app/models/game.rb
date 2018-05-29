class Game < ApplicationRecord
  belongs_to :developer
  has_many :fans
end
