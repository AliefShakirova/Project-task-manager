class Task < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :status, inclusion: { in: ['new', 'in progress', 'completed'] }
end
