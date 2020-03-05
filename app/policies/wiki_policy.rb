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


  class Scope
      attr_reader :user, :scope
    def wiki
      record
    end

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.role == 'admin'
        wikis = scope.all
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.user == user || wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end
