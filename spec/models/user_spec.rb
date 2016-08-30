require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user, first_name: "John", last_name: "Doe")
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end

    it "can't be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "can't be created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe "instance methods" do
    it 'full_name' do
      expect(@user.full_name).to eq("John Doe")
    end
  end
end
