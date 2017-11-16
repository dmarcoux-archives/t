module Database
  NAME_SUFFIX = '_tasks'.freeze

  # Callback when creating a user
  def create_tasks_database
    Apartment::Tenant.create(Database.name(id))
  end

  # Callback when deleting a user
  def drop_tasks_database
    Apartment::Tenant.drop(Database.name(id))
  end

  def self.name(identifier)
    "#{identifier}#{NAME_SUFFIX}"
  end
end
