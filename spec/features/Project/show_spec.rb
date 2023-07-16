require 'rails_helper'

RSpec.describe 'Project show page' do
    # As a visitor,
    # When I visit a project's show page ("/projects/:id"),
    # I see that project's name and material
    # And I also see the theme of the challenge that this project belongs to.
    # (e.g.    Litfit
    #     Material: Lamp Shade
    #   Challenge Theme: Apartment Furnishings)
    it "displays project name, material, challenge theme" do 
        furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        project_1 = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

        visit "/projects/#{project_1.id}"

        expect(page).to have_content("Litfit")
        expect(page).to have_content("Lamp")
        expect(page).to have_content("Apartment Furnishings")
    end
end

