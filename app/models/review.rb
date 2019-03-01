class Review < ApplicationRecord
  belongs_to :order
  has_one :user, through: :order
  validates :rating, presence: true
end
