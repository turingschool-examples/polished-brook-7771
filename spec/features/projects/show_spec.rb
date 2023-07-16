require 'rails_helper'

RSpec.describe "Application show page" do
  it "shows the application's attributes" do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    visit "/projects/#{upholstery_tux.id}"
    # save_and_open_page
    expect(page).to have_content("Project Name: Upholstery Tuxedo")
    expect(page).to have_content("Challenge Theme: Apartment Furnishings")
    expect(page).to have_content("Material: Couch")

    visit "/projects/#{lit_fit.id}"
    # save_and_open_page
    expect(page).to have_content("Project Name: Litfit")
    expect(page).to have_content("Challenge Theme: Apartment Furnishings")
    expect(page).to have_content("Material: Lamp")
  end
end

# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)