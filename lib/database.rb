module Database
  NAME_SUFFIX = '_tasks'.freeze

  # Callback when creating a user
  def create_tasks_database
    ActiveRecord::Base.connection.create_database(new_database_name(email))

    Database.connect_to(new_database_name(email))

    # Migrate the newly created database
    ActiveRecord::Migrator.migrate(Rails.root.join('db/migrate/tasks'))
  end

  # Callback when deleting a user
  def drop_tasks_database
    ActiveRecord::Base.connection.drop_database(new_database_name(email))
  end

  def new_database_name(identifier)
    "#{identifier}#{NAME_SUFFIX}"
  end

  def self.connect_to(database_name)
    config = ActiveRecord::Base.configurations[ENV.fetch('RAILS_ENV')]
                               .merge(database: database_name)

    ActiveRecord::Base.establish_connection(config)
  end
end
