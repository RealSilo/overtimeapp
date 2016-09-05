require 'rails_helper'

describe 'AuditLog Feature' do
  let(:user) { create(:user, first_name: "John", last_name: "Doe") }
  let!(:audit_log) { create(:audit_log, user: user) }
  let!(:admin_user) { create(:admin_user) }

  before do
    login_as(admin_user, scope: :user)
  end

  describe 'index' do
    it 'has an index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log' do
      visit audit_logs_path
      expect(page).to have_content("John Doe")
    end

    it 'can not be accessed by non admin users' do
      logout(:user)
      login_as(user, scope: :user)
      visit audit_logs_path
      expect(current_path).to eq(root_path)
    end
  end
end