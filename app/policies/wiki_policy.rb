class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    !@record.private? || (@user && @record.private? && (@record.user_id == @user.id || @user.admin?) )
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
