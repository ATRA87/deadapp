class Feature < ApplicationRecord
  belongs_to :order
  validates :description, presence: true
end
