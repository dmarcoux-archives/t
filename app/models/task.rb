class Task < ApplicationRecord
  # Each user has his/her tasks in a separate database, so we connect to it
  # TODO: Setup authentication, then uncomment this
  # Database.connect_to(Database.name(current_user.id))
end
