class AuditLogPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def confirm?
    audit_log.user_id = user.id
  end

  private

    def admin?
      admin_types.include?(user.type)
    end

    def audit_log
      record
    end
end