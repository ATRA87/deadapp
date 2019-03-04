class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def new?
    record.order.user = user
  end
  def create?
    record.order.user == user
  end
end
