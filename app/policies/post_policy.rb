class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    record.author_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    record.author_id == user.id
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
