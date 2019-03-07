class Project < ApplicationRecord
  CATEGORIES = %w[Games Business Education Lifestyle Entertainment Travel Health Other]
  belongs_to :user
  has_many :project_members, dependent: :destroy
  has_many :users, through: :project_members
  has_many :customizations, dependent: :destroy
  has_many :project_assets, dependent: :destroy
  has_many :photos, through: :project_assets
  has_many :orders, dependent: :destroy
  has_many :reviews, through: :orders
  validates :name, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  accepts_nested_attributes_for :project_assets
  monetize :price_cents
  has_many :chats

  include PgSearch
  pg_search_scope :search_by_name_and_description,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  def team
    project_members.select do |pm|
      pm.state == 'accepted'
    end.map { |pm2| pm2.user }
  end

  def main_asset
    self.project_assets.find do |pa|
      pa.priority == 1
    end
  end

  def avg_rating
    (communication_rating + quality_rating + delivery_on_time_rating) / 3
  end

  def communication_rating
    return 0 if reviews.count.zero?
    ratings = []
    reviews.each do |review|
      ratings << review.communication_rating
    end
    (ratings.sum / ratings.count.to_f)
  end

  def quality_rating
    return 0 if reviews.count.zero?
    ratings = []
    reviews.each do |review|
      ratings << review.quality_rating
    end
    (ratings.sum / ratings.count.to_f)
  end

  def delivery_on_time_rating
    return 0 if reviews.count.zero?
    ratings = []
    reviews.each do |review|
      ratings << review.delivery_on_time_rating
    end
    (ratings.sum / ratings.count.to_f)
  end

  def chat_users
    users = []
    chats.each do |chat|
      users << chat.sender unless users.include?(chat.sender) or chat.sender == user
    end
    users
  end
end
