  require "rails_helper"

  RSpec.describe "project show page" do
  
# User Story 1 of 3

# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)

  describe "when I visit a project's show page" do
    it "displays that projects name and material" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    
      visit "/projects/#{news_chic.id}"
    
      expect(page).to have_content(news_chic.name)
      expect(page).to have_content(news_chic.material)
    end
  
    it "displays the theme of the challenge that the project belongs to" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    
      visit "/projects/#{news_chic.id}"

      expect(page).to have_content(news_chic.challenge.theme)
    end
  end

  # User Story 3 of 3
  # As a visitor,
  # When I visit a project's show page
  # I see a count of the number of contestants on this project
  
  # (e.g.    Litfit
  #     Material: Lamp Shade
  #   Challenge Theme: Apartment Furnishings
  #   Number of Contestants: 3 )

  describe "when i visit a projects show page" do
    it "displays a count of the number of contestants on that project" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      news_chic.contestants << jay
      news_chic.contestants << gretchen
      news_chic.contestants << kentaro
      news_chic.contestants << erin

      visit "/projects/#{news_chic.id}"

      expect(page).to have_content(4)
    end
  end

end