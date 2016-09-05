class AuditLog < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :start_date, presence: true
  validates :status, presence: true

  after_initialize :set_defaults

  private

    def set_defaults
      self.start_date ||= Date.today - 6.days
    end
end
