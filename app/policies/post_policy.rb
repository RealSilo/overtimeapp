class PostPolicy < ApplicationPolicy
  def update?
    return true if post.approved? && admin?
    return true if user_or_admin && !post.approved?
    #post.user_id == user.id || admin_types.include?(user.type)
  end

  def approve?
    update?
  end

  private

    def user_or_admin
      post.user_id == user.id || admin?
    end

    def admin?
      admin_types.include?(user.type)
    end

    def post
      record
    end
end