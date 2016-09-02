class PostPolicy < ApplicationPolicy
  def update?
    post.user_id == user.id || admin_types.include?(user.type)
  end

  private

    def post
      record
    end
end