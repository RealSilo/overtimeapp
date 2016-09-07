require 'rails_helper'

describe 'Homepage' do
  let(:admin_user) { create(:admin_user) }
  let!(:post) { create(:post, user: user) }

  before do
    login_as(:admin_user, scope: :user)
  end

  it 'allows the admin to approve posts from the homepage' do
    visit root_path
    click_on("approve_post_#{post.id}")
    expect(post.reload.status).to eq('Approved')
  end
end