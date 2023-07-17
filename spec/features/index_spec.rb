require "rails_helper"

# As a visitor,
# When I visit the contestants index page ("/contestants")
# I see a list of names of all the contestants
# And under each contestants name I see a list of the projects (names) that they've been on

# (e.g.   Kentaro Kameyama
#         Projects: Litfit, Rug Tuxedo

#         Jay McCarroll
#         Projects: LeatherFeather)

RSpec.describe "contestants index" do
    it "shows list of names of all the contestants and their projects (names)" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)

      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      
      visit "/contestants"

      expect(page).to have_content(kentaro.name)
      expect(page).to have_content(boardfit.name)
      expect(page).to have_content(upholstery_tux.name)
      expect(page).to have_content(jay.name)
      expect(page).to have_content(news_chic.name)
    end
end