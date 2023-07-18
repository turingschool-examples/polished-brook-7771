require 'rails_helper'


describe "project show page" do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    
    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    
  end

# User Story 1 of 3 
# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)

  it "has name and material" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content(@news_chic.name)
    expect(page).to have_content(@news_chic.material)
  end

  it "has challenge theme" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content(@recycled_material_challenge.theme)
  end


#   User Story 3 of 3
# As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project

# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )

  it "counts the number of contestants on a project" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Contestants for this Project: 2")
  end

# User Story Extension 1 - Average years of experience for contestants by project

# As a visitor,
# When I visit a project's show page
# I see the average years of experience for the contestants that worked on that project
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3
#   Average Contestant Experience: 10.25 years)

  it "has average year of experience for contastants by project" do
    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content("Average Experience of Contestants: 12.5")
  end

end