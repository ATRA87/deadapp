class ProjectAsset < ApplicationRecord
  belongs_to :project
  # validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
