class Order < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :features
  has_one :review
  monetize :amount_cents

  def state
    if dev_state == client_state
      return client_state
    elsif dev_state == 1 && client_state == 1
      return 1
    elsif dev_state == 2 || client_state == 2
      return 2
    end
  end


end
