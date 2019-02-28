class Project < ApplicationRecord
  CATEGORIES = %w[Games Business Education Lifestyle Entretainment Travel Health Other]
  belongs_to :user
  has_many :project_members, dependent: :destroy
  has_many :users, through: :project_members
  has_many :project_assets, dependent: :destroy
  has_many :project_details, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reviews, through: :orders
  validates :name, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  def rating
    ratings = []
    self.reviews.each do |review|
      ratings << review.rating
    end
    return ratings.empty? ? 0 : ratings.sum / ratings.count
  end
end
