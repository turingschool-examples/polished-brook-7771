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
end