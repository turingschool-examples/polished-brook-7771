require 'rails_helper'

RSpec.describe "contestants index page" do
  before(:each) do
    @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)

    @rug_tux = @furniture_challenge.projects.create!(name: "Rug Tuxedo", material: "Rug")
    @lit_fit = @furniture_challenge.projects.create!(name: "Litfit", material: "Lamp")
    @leather_feather = @furniture_challenge.projects.create!(name: "LeatherFeather", material: "Leather")
    
    @kentaro = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
  
    ContestantProject.create!(contestant: @kentaro, project: @lit_fit)
    ContestantProject.create!(contestant: @kentaro, project: @rug_tux)
    ContestantProject.create!(contestant: @jay, project: @leather_feather)
  end

  describe "as a visitor" do
    describe "when I visit the contestants index page" do
      it "has a list of names of all the contestants and projects they are assigned to" do

        visit "/contestants"

        expect(page).to have_content("Kentaro Kameyama")
        expect(page).to have_content(@lit_fit.name)
        expect(page).to have_content(@rug_tux.name)

        expect(page).to have_content("Jay McCarroll")
        expect(page).to have_content(@leather_feather.name)
      end
    end
  end
end