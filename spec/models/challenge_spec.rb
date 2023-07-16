require "rails_helper"

RSpec.describe Challenge, type: :model do
  before(:each) do
    test_data
  end
  describe "validations" do
    it {should validate_presence_of :theme}
    it {should validate_presence_of :project_budget}
  end

  describe "relationships" do
    it {should have_many :projects}
  end

  describe "#self.find_by_project" do
    it "can find an associated Challenge using #where to match a project to the challenge_id" do
      challenge_1 = Challenge.find_by_project(@news_chic.id)
      challenge_2 = Challenge.find_by_project(@lit_fit.id)

      expect(challenge_1.first.theme).to eq("Recycled Material")
      expect(challenge_2.first.theme).to eq("Apartment Furnishings")
    end
  end
end
