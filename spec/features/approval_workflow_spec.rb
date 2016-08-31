require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = create(:admin_user)
    @user = create(:user)
    login_as(@admin_user, scope: :user)
  end

  describe 'edit' do
    before do
      @post = create(:post, user: @user)
    end

    it 'has a status that can be edited' do
      visit edit_post_path(@post)
      choose('post_status_approved')
      click_on 'Save'
      expect(@post.reload.status).to eq('approved')
    end
  end
end