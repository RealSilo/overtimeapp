class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user

  delegate :full_name, to: :user, prefix: true
  
  validates :date, presence: true
  validates :rationale, presence: true
  validates :overtime_request,  presence: true, numericality: { greater_than: 0.0 }
  validates :user, presence: true
  validates :status, presence: true

  after_save :update_audit_log

  private

    def update_audit_log
      audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
      if audit_log
        audit_log.confirmed!
      end
    end
end
