class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = ["admin", "editor"]

  def display_name
    self.email.split("@").first
  end

  def is_admin?
    self.role == "admin"
  end

  def is_editor?
    ["admin", "editor"].include?(self.role)
  end

  has_many :memberships
  has_many :groups, through: :memberships, source: :group

  has_one :profile

  accepts_nested_attributes_for :profile

  has_many :registrations
end
