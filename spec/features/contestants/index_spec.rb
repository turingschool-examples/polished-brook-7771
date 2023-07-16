require 'rails_helper'

RSpec.describe 'Contestants index page' do 
    # As a visitor,
    # When I visit the contestants index page ("/contestants")
    # I see a list of names of all the contestants
    # And under each contestants name I see a list of the projects (names) that they've been on

    # (e.g.   Kentaro Kameyama
    #     Projects: Litfit, Rug Tuxedo

    #     Jay McCarroll
    #     Projects: LeatherFeather)
    it "displays a list of names and projects for all contestants" do 
        contestant_1 = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        contestant_2 = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        project_1 = contestant_1.projects.create(name: "Litfit", material: "Lamp")
        project_2 = contestant_1.projects.create(name: "Boardfit", material: "Cardboard Boxes")
        project_3 = contestant_2.projects.create(name: "Upholstery Tuxedo", material: "Couch")

        visit "/contestants"

        expect(page).to have_content("Jay McCarroll")
        expect(page).to have_content("Gretchen Jones")

        expect(page).to have_content("Litfit")
        expect(page).to have_content("Boardfit")
        expect(page).to have_content("Upholstery Tuxedo")
    end
end