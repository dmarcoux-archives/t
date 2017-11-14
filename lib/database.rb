module Database
  NAME_SUFFIX = '_tasks'.freeze

  # Callback when creating a user
  def create_tasks_database
    ActiveRecord::Base.connection.create_database(Database.name(email))

    Database.connect_to(Database.name(email))

    # Migrate the newly created database
    ActiveRecord::Migrator.migrate(Rails.root.join('db/migrate/tasks'))

    # Reset database connection to what it was before calling this method
    Database.connect_to(ENV.fetch('POSTGRES_DB'))
  end

  # Callback when deleting a user
  def drop_tasks_database
    # Connect to the users database
    Database.connect_to(ENV.fetch('POSTGRES_DB'))
    # so we can drop the tasks database of the user
    ActiveRecord::Base.connection.drop_database(Database.name(email))
  end

  def self.name(identifier)
    "#{identifier}#{NAME_SUFFIX}"
  end

  def self.connect_to(database_name)
    config = ActiveRecord::Base.configurations[ENV.fetch('RAILS_ENV')]
                               .merge(database: database_name)

    ActiveRecord::Base.establish_connection(config)
  end
end
