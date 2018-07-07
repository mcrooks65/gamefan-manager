class Developer < ApplicationRecord
  has_many :games
  has_many :fans, through: :games
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :employees, presence: true,  numericality: { greater_than: 0 } 
  validates :location, presence: true
  validates :password, presence: true, length: {within: 5..30}

  def self.most_fans
    self.select { |dev| dev.fans.count }
  end
end
