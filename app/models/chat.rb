class Chat < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :target, class_name: "User"
  belongs_to :project
  after_create :notify_pusher, on: :create

  def notify_pusher
    Pusher.trigger('chat', 'new', self.as_json)
  end
end
