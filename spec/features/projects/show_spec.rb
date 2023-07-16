require "rails_helper"

RSpec.describe "Project show page" do
  before do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 9)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)


    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @jay.id, project_id: @boardfit.id)
  end
#   User Story 1 of 3

# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)

  it "displays the project's name and material" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("News Chic")
    expect(page).to have_content("Material: Newspaper")
  end

  it "shows the theme of the challenge this project belongs to" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Challenge Theme: Recycled Material")
  end

#   User Story 3 of 3
# As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project

# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )

  it "has a count of how many contestants are on this project" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Number of Contestants: 2")

    visit "/projects/#{@lit_fit.id}"
    
    expect(page).to have_content("Number of Contestants: 0")

    visit "/projects/#{@boardfit.id}"

    expect(page).to have_content("Number of Contestants: 3")
  end

#   User Story Extension 1 - Average years of experience for contestants by project

# As a visitor,
# When I visit a project's show page
# I see the average years of experience for the contestants that worked on that project
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3
#   Average Contestant Experience: 10.25 years)
  it "shows average years of experience for contestants who worked on the project" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Average Contestant Experience: 12.5 years")
    
    visit "/projects/#{@lit_fit.id}"

    expect(page).to have_content("Average Contestant Experience: N/A years")

    visit "/projects/#{@boardfit.id}"

    expect(page).to have_content("Average Contestant Experience: 12.3 years")

  end
end