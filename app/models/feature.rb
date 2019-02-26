class Feature < ApplicationRecord
  belongs_to :order
  validates :description
end
