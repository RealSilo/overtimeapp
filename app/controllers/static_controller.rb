class StaticController < ApplicationController
  before_action :authenticate_user!
  def homepage
    if current_user && admin_types.include?(current_user.type)
      @pending_approvals = Post.submitted
      @recent_audit_logs = AuditLog.last(12)
    else
      @pending_audit_confirmations = current_user.audit_logs.pending
    end
  end
end