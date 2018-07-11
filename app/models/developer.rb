class Developer < ApplicationRecord
  has_many :games
  has_many :fans, through: :games
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :employees, presence: true,  numericality: { greater_than: 0 } 
  validates :location, presence: true
  validates :password, presence: true, length: {within: 5..30}

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |dev|
      dev.email = auth.info.email
      dev.uid = auth.uid
      dev.provider = auth.provider
      dev.avatar_url = auth.info.image
      dev.username = auth.info.name
      dev.oauth_token = auth.credentials.token
      dev.save!
    end
  end

  def self.order_by_number_of_games
    self.joins(:games)
    .group("developers.id")
    .order('COUNT(games.id) DESC')
  end
end

#  self.joins(:games).group("developers.id").order(name: :asc).size.each do |dev_id, game_count|
#  puts "#{Developer.find_by(id: dev_id).name}"
#  puts "#{game_count}"
#  end
