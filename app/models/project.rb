class Project < ApplicationRecord
  CATEGORIES = %w[Games Business Education Lifestyle Entretainment Travel Health Other]
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

  def rating
    ratings = []
    self.reviews.each do |review|
      ratings << review.rating
    end
    return ratings.empty? ? 0 : ratings.sum / ratings.count
  end

  def team
    self.project_members.select do |pm|
      pm.state == 'accepted'
    end.map { |pm2| pm2.user }
  end
  
  def main_asset
    self.project_assets.find do |pa|
      pa.priority == 1
    end
  end
end
