class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user

  delegate :full_name, to: :user, prefix: true
  
  validates :date, presence: true
  validates :rationale, presence: true
  validates :overtime_request,  presence: true, numericality: { greater_than: 0.0 }
  validates :user, presence: true
  validates :status, presence: true
end
