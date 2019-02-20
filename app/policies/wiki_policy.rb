class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    :user_signed_in?
    scope.where(:id => record.id).exists?
  end

  def create?
    :user_signed_in?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def update?
    user.present?
  end

  def destroy?
    user.admin? || (record.user == user)
  end


  class Scope < Scope

    def resolve
      scope
    end
  end
end
