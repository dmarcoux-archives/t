class Task < ApplicationRecord
  validates_presence_of :start, :end, :description
  # TODO: Validate dates start < end
end
