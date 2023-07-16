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
    it 'displays a list of names and projects for all contestants' do
        challenge_1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        challenge_2 = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        contestant_1 = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        contestant_2 = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        project_1 = contestant_1.projects.create!(name: "News Chic", material: "Newspaper", challenge: challenge_1)
        project_2 = contestant_2.projects.create!(name: "Upholstery Tuxedo", material: "Couch", challenge: challenge_2)
    
        visit "/contestants"
    
        expect(page).to have_content(contestant_1.name)
        expect(page).to have_content(contestant_2.name)

        expect(page).to have_content("News Chic")                  
        expect(page).to have_content("Upholstery Tuxedo") 
    end
end