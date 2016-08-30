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

    it 'can be reached by going to edit page' do
      visit posts_path
      click_link 'Edit'
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"
      expect(page).to have_content("Edited content")
    end
  end
end