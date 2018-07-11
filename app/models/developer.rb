class Developer < ApplicationRecord
  has_many :games
  has_many :fans, through: :games
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :employees, presence: true,  numericality: { greater_than: 0 } 
  validates :location, presence: true
  validates :password, presence: true, length: {within: 5..30}

  def self.order_by_number_of_games
    self.joins(:games).group("developers.id").order(name: :desc).size

  end
end
