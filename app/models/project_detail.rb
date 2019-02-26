class ProjectDetail < ApplicationRecord
  belongs_to :project
  validates :description
end
