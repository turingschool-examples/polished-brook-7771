require "rails_helper"

RSpec.feature "Projects", type: :feature do
  it "can see a project's name and material" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    project_1 = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    material = project_1.material
    
    visit "/project/#{project_1.id}"

    expect(page).to have_content(project_1.name)
    expect(page).to have_content(project_1.material)
  end

#   User Story 3 of 3
# As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project

# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )

  it "can see a count of the number of contestants on this project" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) 
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)

    visit "/projects"

    expect(page).to have_content("Number of Contestants: 2")
  end

#     As a visitor,
# When I visit a project's show page
# I see the average years of experience for the contestants that worked on that project
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3
#   Average Contestant Experience: 10.25 years)

  it "can see the average years of experience for the contestants that worked on that project" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    
    visit "/project/#{news_chic.id}"

    expect(page).to have_content(news_chic.name)
    expect(page).to have_content(news_chic.material)
    expect(page).to have_content("Average Contestant Experience: 13.0 years")
  end

#   As a visitor,
# When I visit a project's show page
# I see a form to add a contestant to this project
# When I fill out a field with an existing contestants id
# And hit "Add Contestant To Project"
# I'm taken back to the project's show page
# And I see that the number of contestants has increased by 1
# And when I visit the contestants index page
# I see that project listed under that contestant's name
  it "can see a form to add a contestant to this project" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    bob = Contestant.create(name: "Bob McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    
    visit "/project/#{news_chic.id}"


    expect(page).to have_content(news_chic.name)
    expect(page).to have_content(news_chic.material)
    expect(page).to have_content("Average Contestant Experience: 13.0 years")
    expect(page).to have_content("Number of contestants: 1")
    expect(page).to have_content("Add Contestant To Project")
    expect(page).to have_content("Contestant Id")
    expect(page).to have_button("Add Contestant To Project")
    
    fill_in "contestant_id", with: "#{bob.id}"
    click_button "Add Contestant To Project"

    expect(current_path).to eq("/project/#{news_chic.id}")
    expect(page).to have_content("Number of contestants: 2")
  end
end

# I am not sure that I got the last challenge correct, can someone please review it and let me know if I did it correctly?
