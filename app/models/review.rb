class Review < ApplicationRecord
  belongs_to :order
  has_one :user, through: :order
  has_one :project, through: :order
  validates :rating, presence: true
end
