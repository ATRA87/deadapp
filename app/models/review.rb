class Review < ApplicationRecord
  STARS = (1..5).to_a
  belongs_to :order
  has_one :user, through: :order
  has_one :project, through: :order
  # this is a global constant accesable with using syntax 'Review::STARS'
  validates :communication_rating, :quality_rating, :delivery_on_time_rating, inclusion: { in: STARS }
end
