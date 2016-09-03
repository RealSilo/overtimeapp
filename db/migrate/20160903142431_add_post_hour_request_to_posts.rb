class AddPostHourRequestToPosts < ActiveRecord::Migration[5.0]
  def up
    add_column :posts, :overtime_request, :decimal, default: 0.0
  end

  def down
    remove_column :posts, :overtime_request, :decimal
  end
end
