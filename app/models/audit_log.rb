class AuditLog < ApplicationRecord
  enum status: { pending: 0, confirmed: 2}

  belongs_to :user

  validates :user, presence: true
  validates :start_date, presence: true
  validates :status, presence: true

  delegate :full_name, to: :user, prefix: true

  after_initialize :set_defaults

  private

    def set_defaults
      self.start_date ||= Date.today - 6.days
    end
end
