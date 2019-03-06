class Order < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :features
  has_one :review
  monetize :amount_cents

  def state
    return 'declined' if dev_state == 3 || client_state == 3
    return 'delivered' if dev_state == 2
    return 'accepted' if dev_state == 1 && client_state == 1
    return 'pending' if dev_state.zero? && client_state.zero?
    return 'awaiting_payment' if client_state.zero?
  end

  def project_owner?(current_user)
    project.user == current_user
  end

  def reviewed?
    !review.nil?
  end

  def finished?
    state == 'finished' || state == 'delivered' || state == 'accepted'
  end
end
