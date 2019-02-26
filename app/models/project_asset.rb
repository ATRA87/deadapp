class ProjectAsset < ApplicationRecord
  belongs_to :project
  validates :web_url
end
