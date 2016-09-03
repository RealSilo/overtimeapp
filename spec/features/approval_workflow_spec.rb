require 'rails_helper'

describe 'navigate' do
  let(:user) { create(:user) }
  let(:admin_user) { create(:admin_user) }
  let(:post) { create(:post, user: user) }
  before do    
    login_as(admin_user, scope: :user)
  end

  describe 'edit' do
    before do
      visit edit_post_path(post)
    end

    it 'has a status that can be edited by an admin' do
      choose('post_status_approved')
      click_on 'Save'
      expect(post.reload.status).to eq('approved')
    end

    it 'can not be edited by a non admin' do
      logout(:user)
      login_as(user, scope: :user)
      visit edit_post_path(post)
      expect(page).to_not have_content('Approved')
    end

    it 'can not be edited by user after approval' do
      logout(:user)
      login_as(user, scope: :user)
      post.update(status: 'approved')
      visit edit_post_path(post)
      expect(current_path).to eq(root_path)
    end
  end
end