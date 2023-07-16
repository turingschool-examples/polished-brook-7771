require 'rails_helper'

RSpec.describe "projects index" do
  before(:each) do
    @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
      
    @lit_fit = @furniture_challenge.projects.create!(name: "Litfit", material: "Lamp")
    @leather_feather = @furniture_challenge.projects.create!(name: "LeatherFeather", material: "Leather")
  end
  describe "when I visit the root page" do
    it "has a link to each project" do
      visit "/projects"

      expect(page).to have_link("Projects")
    end
  end
end