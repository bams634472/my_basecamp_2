class Message < ApplicationRecord
  belongs_to :project_thread
  belongs_to :user

  validates :body, presence: true
end