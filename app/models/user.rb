class User < ActiveRecord::Base
  has_many :wikis
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :default_role

  enum role: [:standard, :premium, :admin]

  private

  def default_role
    self.role ||= :standard
  end
end
