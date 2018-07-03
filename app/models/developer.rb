class Developer < ApplicationRecord
  has_many :games
  has_many :fans, through: :games

  validates :name, presence: true, uniqueness: true
  validates :employees, presence: true,  numericality: { greater_than: 0 } 
  validates :location, presence: true
end
