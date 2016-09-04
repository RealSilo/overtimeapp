require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    let(:post) { build_stubbed(:post) }
    before do
      user = create(:user)
    end

    it "can be created" do
      expect(post).to be_valid
    end

    it "can not be created without date" do
      post.date = nil
      expect(post).to_not be_valid
    end

    it "can not be creted without rationale" do
      post.rationale = nil
      expect(post).to_not be_valid
    end

    it "can not be creted without rationale" do
      post.rationale = nil
      expect(post).to_not be_valid
    end

    it "can not be creted without overtime request" do
      post.rationale = nil
      expect(post).to_not be_valid
    end
  end
end
