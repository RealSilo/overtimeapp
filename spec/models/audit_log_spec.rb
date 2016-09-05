require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  let(:user) { create(:user) }
  let(:audit_log) { build_stubbed(:audit_log, user: user) }

  describe 'creation' do
    it 'can be properly created' do
      expect(audit_log).to be_valid
    end

    it 'should always belong to a user' do
      audit_log.user = nil
      expect(audit_log).to_not be_valid
    end

    it 'should always have a status' do
      audit_log.status = nil
      expect(audit_log).to_not be_valid
    end

    it 'can not be created without start_date' do
      audit_log.start_date = nil
      expect(audit_log).to_not be_valid
    end

    it 'should have a start date equal to 6 days prior' do
      new_audit_log = AuditLog.create(user: user)
      expect(new_audit_log.start_date).to eq(Date.today - 6.days)
    end
  end
end
