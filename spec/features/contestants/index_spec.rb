require "rails_helper"

RSpec.describe "contestants index page" do

# User Story 2 of 3

# As a visitor,
# When I visit the contestants index page ("/contestants")
# I see a list of names of all the contestants
# And under each contestants name I see a list of the projects (names) that they've been on

# (e.g.   Kentaro Kameyama
#         Projects: Litfit, Rug Tuxedo

#         Jay McCarroll
#         Projects: LeatherFeather)

  describe "when I visit the contestants index page" do

    it "displays a list of names of all the contestants" do
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

      visit "/contestants"

      expect(page).to have_content(jay.name)
      expect(page).to have_content(gretchen.name)
      expect(page).to have_content(kentaro.name)
      expect(page).to have_content(erin.name)
    end

    it "displays under each contestant a list of project names that they have participated in" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

      jay.projects << news_chic
      gretchen.projects << news_chic
      gretchen.projects << boardfit
      kentaro.projects << upholstery_tux
      kentaro.projects << lit_fit
      erin.projects << lit_fit

      visit "/contestants"

      expect(jay.projects.first).to eq(news_chic)
      expect(gretchen.projects.first).to eq(news_chic)
      expect(kentaro.projects.first).to eq(upholstery_tux)
      expect(erin.projects.first).to eq(lit_fit)

      expect(page).to have_content(news_chic.name)
      
    end
  end
end