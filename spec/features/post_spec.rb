require 'rails_helper'

describe 'navigate' do

  before do
    @user = create(:user)
    login_as(@user, scope: :user)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of posts' do
      visit posts_path
      expect(page).to have_content('Posts')
    end

    it 'has a list of posts' do
      post1 = build_stubbed(:post, user: @user)
      post2 = build_stubbed(:second_post, user: @user)
      visit posts_path
      expect(page).to have_content
    end
  end

  describe 'new post' do
    it 'has a link from the homepage' do
      visit root_path
      click_link 'New Entry'
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creating post' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created on new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"
      expect(page).to have_content("Some rationale")
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

  describe 'updating post' do
    before do
      @post = create(:post, user: @user)
    end

    it 'can be edited by an authorized user' do
      visit posts_path
      within "#edit_post_#{@post.id}" do
        click_on 'Edit'
      end
      expect(page).to have_content("#{@post.rationale}")
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on 'Save'
      expect(page).to have_content("Edited content")
    end

    it 'can not be edit by a non authorized user' do
      logout(:user)
      non_authorized_user = create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)
      visit edit_post_path(@post)
      expect(current_path).to eq(root_path)
    end
  end

  describe 'deleting post' do
    before do
      @post = create(:post, user: @user)
    end

    it 'can be deleted' do
      visit posts_path
      within "#delete_post_#{@post.id}" do
        click_on 'Delete'
      end
      expect(page.status_code).to eq(200)
    end
  end
end