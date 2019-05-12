class User < ActiveRecord::Base
  has_many :collaborators
  has_many :wikis, through: :collaborators
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :default_role

  enum role: [:standard, :premium, :admin]

  private

  def default_role
    self.role ||= :standard
  end
end
