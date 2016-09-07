class StaticController < ApplicationController
  def homepage
    if current_user && admin_types.include?(current_user.type)
      @pending_approvals = Post.submitted
      @recent_audit_logs = AuditLog.last(12)
    else

    end
  end
end