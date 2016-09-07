require 'rails_helper'

describe 'Homepage' do
  let!(:admin_user) { create(:admin_user) }
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:audit_log) { create(:audit_log, user: user) }

  it "allows the admin to approve posts from the homepage" do
    login_as(admin_user, scope: :user)
    visit root_path
    click_on("approve_post_#{post.id}")
    expect(post.reload.status).to eq('approved')
  end

  it "allows the user to approve posts from the homepage" do
    login_as(user, scope: :user)
    visit root_path
    click_on("pac_#{post.id}")
    expect(audit_log.reload.status).to eq('confirmed')
  end
end