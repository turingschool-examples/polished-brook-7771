require "rails_helper"

# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)

RSpec.describe "project show" do
    it "shows the project's name and material and the theme of the challenge" do
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

      furniture_challenge.projects << lit_fit

      visit "/projects/#{lit_fit.id}"

      expect(page).to have_content(lit_fit.name)
      expect(page).to have_content(lit_fit.material)
      expect(page).to have_content(furniture_challenge.theme)
    end

#     As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project

# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )
  it "shows number of contestants" do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    ContestantProject.create(contestant_id: jay.id, project_id: lit_fit.id)

    furniture_challenge.projects << lit_fit

    visit "/projects/#{lit_fit.id}"
  
    expect(page).to have_content("Number of Contestants: 1")
  end

  it "shows number of contestants(more than one)" do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    
    ContestantProject.create(contestant_id: jay.id, project_id: lit_fit.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: lit_fit.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: lit_fit.id)

    furniture_challenge.projects << lit_fit

    visit "/projects/#{lit_fit.id}"
  
    expect(page).to have_content("Number of Contestants: 3")
  end
end