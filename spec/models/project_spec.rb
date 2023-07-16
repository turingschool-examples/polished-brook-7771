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

  describe "project_count" do
    it "returns the number of projects for each contestant" do
      furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
      
      lit_fit = furniture_challenge.projects.create!(name: "Litfit", material: "Lamp")
      leather_feather = furniture_challenge.projects.create!(name: "LeatherFeather", material: "Leather")
      
      kentaro = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    
      ContestantProject.create!(contestant: kentaro, project: lit_fit)
      ContestantProject.create!(contestant: kentaro, project: leather_feather)
      ContestantProject.create!(contestant: jay, project: leather_feather)

      expect(leather_feather.project_count).to eq(2)
      expect(lit_fit.project_count).to eq(1)
    end
  end
end
