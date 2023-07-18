require 'rails_helper'


describe "project show page" do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    
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

# User Story Extension 2 - Adding a contestant to a project

# As a visitor,
# When I visit a project's show page
# I see a form to add a contestant to this project
# When I fill out a field with an existing contestants id
# And hit "Add Contestant To Project"
# I'm taken back to the project's show page
# And I see that the number of contestants has increased by 1
# And when I visit the contestants index page
# I see that project listed under that contestant's name

  it "can add a contestant to a project" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Contestants for this Project: 2")

    fill_in("contestant_id", with: @kentaro.id)
    click_button "Add"
    
    expect(page).to have_content("Contestants for this Project: 3")
  end

end