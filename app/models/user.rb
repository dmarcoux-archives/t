class User < ApplicationRecord
  include Database

  after_create_commit :create_tasks_database
  after_destroy_commit :drop_tasks_database
end
