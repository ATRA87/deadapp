class ProjectDetail < ApplicationRecord
  belongs_to :project
  validates :description, presence: true
end
