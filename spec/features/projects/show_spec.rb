require 'rails_helper'

RSpec.describe "project show page" do
  before(:each) do
    @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
      
    @lit_fit = @furniture_challenge.projects.create!(name: "Litfit", material: "Lamp")
    @leather_feather = @furniture_challenge.projects.create!(name: "LeatherFeather", material: "Leather")
    
    # Contestants
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
    
    # Lit Fit
    ContestantProject.create!(contestant: @kentaro, project: @lit_fit)
    ContestantProject.create!(contestant: @erin, project: @lit_fit)
    ContestantProject.create!(contestant: @gretchen, project: @lit_fit)
    # Leather Feather
    ContestantProject.create!(contestant: @kentaro, project: @leather_feather)
    ContestantProject.create!(contestant: @jay, project: @leather_feather)
  end

  describe "as a visitor" do
    describe "when I visit a project show page" do
      it "I see the theme of the challenge and projects they belong to" do

        visit "/projects/#{@lit_fit.id}"

        expect(page).to have_content("Litfit")
        expect(page).to have_content("Lamp")
        expect(page).to have_content("Apartment Furnishings")
      end
      
      it "it shows a count of the number of contestants on each project" do
        
        visit "/projects/#{@lit_fit.id}"
        expect(page).to have_content("Number of Contestants: 3")
        
        visit "/projects/#{@leather_feather.id}"
        expect(page).to have_content("Number of Contestants: 2")
      end
    end
  end
end