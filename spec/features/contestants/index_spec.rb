require "rails_helper"

RSpec.describe " Contestants index" do
  it "should display all contests and their associated project" do

    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: erin.id, project_id: boardfit.id)

    visit "/contestants"

    expect(page).to have_content("Name: Jay McCarroll")
    expect(page).to have_content("Project: News Chic")

    expect(page).to have_content("Name: Kentaro Kameyama")
    expect(page).to have_content("Project: Upholstery Tuxedo")

    expect(page).to have_content("Name: Erin Robertson")
    expect(page).to have_content("Project: Boardfit")

  end
end

# User Story 2 of 3

# As a visitor,
# When I visit the contestants index page ("/contestants")
# I see a list of names of all the contestants
# And under each contestants name I see a list of the projects (names) that they've been on

# (e.g.   Kentaro Kameyama
#         Projects: Litfit, Rug Tuxedo

#         Jay McCarroll
#         Projects: LeatherFeather)