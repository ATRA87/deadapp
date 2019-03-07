class Customization < ApplicationRecord
  OPTIONS = ["Color Scheme", "Font", "Button Shape", "Log In using Social Media"]
  belongs_to :project
  validates :description, presence: true
end
