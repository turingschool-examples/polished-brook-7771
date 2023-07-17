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

    # User Story 3
    # As a visitor,
    # When I visit a project's show page
    # I see a count of the number of contestants on this project

    # (e.g.    Litfit
    #     Material: Lamp Shade
    # Challenge Theme: Apartment Furnishings
    # Number of Contestants: 3 )

    it "displays the number of contestants on the project" do 
        challenge_1 = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        contestant_1 = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        contestant_2 = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        project_1 = contestant_1.projects.create!(name: "News Chic", material: "Newspaper", challenge: challenge_1)

        visit "/projects/#{project_1.id}"

        expect(page).to have_content("Number of Contestants: 2")

    end
end

