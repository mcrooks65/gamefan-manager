class Game < ApplicationRecord
  belongs_to :developer
  has_many :fans

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :genre, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 } 
end
