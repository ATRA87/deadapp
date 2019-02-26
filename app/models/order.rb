class Order < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :features
  has_one :review
end
