class Project < ApplicationRecord
  belongs_to :user
  has_many :project_members, dependent: :destroy
  has_many :users, through: :project_members
  has_many :customizations, dependent: :destroy
  has_many :project_details, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reviews, through: :orders
  validates :name, presence: true

  def rating
    ratings = []
    self.reviews.each do |review|
      ratings << review.rating
    end
    return ratings.empty? ? 0 : ratings.sum / ratings.count
  end
end
