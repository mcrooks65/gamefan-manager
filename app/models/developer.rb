class Developer < ApplicationRecord
  has_many :games
  has_many :fans, through: :games

  validates :name, presence: true, uniqueness: true
  validates :employees, presence: true,  numericality: { greater_than: 0 } 
  validates :location, presence: true

  def self.most_fans
    self.select { |dev| dev.fans.count }
  end
end
