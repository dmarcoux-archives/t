class User < ApplicationRecord
  validates_presence_of :email, :password_digest
  validates :email, uniqueness: true

  # Encrypt password with bcrypt
  has_secure_password

  # This should be executed in a job as it doesn't scale well with callbacks
  after_create_commit :create_tasks_database
  after_destroy_commit :drop_tasks_database
end
