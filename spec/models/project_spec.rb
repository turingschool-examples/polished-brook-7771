require "rails_helper"

RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "#contestant_count" do
    it 'returns the count of contestants associated with the project' do
      challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      project = Project.create(name: "News Chic", material: "Newspaper", challenge: challenge)

      contestant_1 = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      contestant_2 = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      project.contestants << contestant_1
      project.contestants << contestant_2

      expect(project.contestant_count).to eq(2)
    end
  end
end
