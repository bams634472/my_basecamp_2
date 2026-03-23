class User < ApplicationRecord
  has_secure_password

  has_many :owned_projects, class_name: "Project", foreign_key: :owner_id, dependent: :destroy
  has_many :project_memberships, dependent: :destroy
  has_many :projects, through: :project_memberships
  has_many :attachments, dependent: :destroy
  has_many :project_threads, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def admin_of?(project)
    project_memberships.exists?(project_id: project.id, admin: true)
  end

  def member_of?(project)
    project_memberships.exists?(project_id: project.id)
  end
end
