class Review < ApplicationRecord
  belongs_to :user
  belongs_to :order
  validates :rating, presence: true
end
