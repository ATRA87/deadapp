class Project < ApplicationRecord
  belongs_to :user
  has_many :project_members, dependent: :destroy
  has_many :users, through: :project_members
  has_many :project_assets, dependent: :destroy
  has_many :project_details, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reviews, through: :orders
  validates :name, presence: true
end
