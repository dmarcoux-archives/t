class Task < ApplicationRecord
  validates_presence_of :start, :end, :description
  validate :validate_start
  validate :validate_end

  def validate_start
    errors.add(:start, 'must be in the future') if start < Time.now
    errors.add(:start, 'must be before the end date') if start >= self.end
  end

  def validate_end
    errors.add(:end, 'must be in the future') if self.end < Time.now
  end
end
