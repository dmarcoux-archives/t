class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    unless ActiveRecord::Base.connection_config[:database].ends_with?(Database::NAME_SUFFIX)
      # verbose is false when rolling back and we want to display messages all the time, not only when migrating
      self.verbose = true

      say("Skipping CreateTasks migration, it runs only on database ending by '#{Database::NAME_SUFFIX}'")
      return
    end

    create_table :tasks do |t|
      t.datetime :start
      t.datetime :end
      t.string :description
    end
  end
end
