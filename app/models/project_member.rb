class ProjectMember < ApplicationRecord
  belongs_to :user
  belongs_to :project

  enum state: { pending: 0, accepted: 1, declined: 2 }
end
