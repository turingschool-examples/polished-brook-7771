require "rails_helper"

RSpec.describe Contestant, type: :model do
  before(:each) do
    test_data
  end
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe "#project_names" do
    it "should map and return the name of the contestants projects" do
    expect(@jay.project_names).to eq([@news_chic.name])
    expect(@gretchen.project_names).to eq([@news_chic.name, @upholstery_tux.name])
    end
  end
end
