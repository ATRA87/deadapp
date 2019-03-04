class Review < ApplicationRecord
  belongs_to :order
  has_one :user, through: :order
  has_one :project, through: :order
  # this is a global constant accesable with using syntax 'Review::STARS'
  STARS = (1..5).to_a
  validates :communication_rating, :quality_rating, :delivery_on_time_rating, presence: true, inclusion: { in: STARS }
end
