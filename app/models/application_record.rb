# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def deadline_valid?
    errors.add(:deadline, 'Cannot be less than the current date') if deadline <= Time.now
  end
end
