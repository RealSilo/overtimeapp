require 'rails_helper'

describe 'navigate' do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user, rationale: "haha") }

  before do
    login_as(user, scope: :user)
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
      post2 = create(:second_post, user: user, rationale: "hihi")
      visit posts_path
      expect(page).to have_content("haha")
      expect(page).to have_content("hihi")
    end

    it 'lists only authorized posts' do
      user_na = create(:non_authorized_user)
      post2 = create(:second_post, user: user_na, rationale: "hihi")
      visit posts_path
      expect(page).to have_content("haha")
      expect(page).to_not have_content("hihi")
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
      fill_in 'post[overtime_request]', with: 3.0
      expect { click_on "Save" }.to change(Post, :count).by(1)
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      fill_in 'post[overtime_request]', with: 2.5
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

  describe 'updating post' do

    it 'can be edited by an authorized user' do
      visit posts_path
      within "#edit_post_#{post.id}" do
        click_on 'Edit'
      end
      expect(page).to have_content("#{post.rationale}")
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on 'Save'
      expect(page).to have_content("Edited content")
    end

    it 'can not be edit by a non authorized user' do
      logout(:user)
      non_authorized_user = create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)
      visit edit_post_path(post)
      expect(current_path).to eq(root_path)
    end
  end

  describe 'deleting post' do

    it 'can be deleted' do
      visit posts_path
      within "#delete_post_#{post.id}" do
        click_on 'Delete'
      end
      expect(page.status_code).to eq(200)
    end
  end
end