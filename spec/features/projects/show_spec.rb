require 'rails_helper'

RSpec.describe "projects show page" do

  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
  
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
  
    @cp_1 = ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    @cp_2 = ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    @cp_3 = ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    @cp_4 = ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    @cp_5 = ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
  end

  it "displays the projects name, material, and theme" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("News Chic")
    expect(page).to have_content("Newspaper")
    expect(page).to have_content("Recycled Material")
    expect(page).to_not have_content("Boardfit")

    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("Upholstery Tuxedo")
    expect(page).to have_content("Couch")
    expect(page).to have_content("Apartment Furnishings")
    expect(page).to_not have_content("New Chic")
  end

  it "displays the number of contestants on the project" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("2")

    visit "/projects/#{@boardfit.id}"
    
    expect(page).to have_content("1")
    
    visit "/projects/#{@lit_fit.id}"
    
    expect(page).to have_content("0")
  end

  it "displays the average years of experiences for contestants that worked on it" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("12.5")

    visit "/projects/#{@boardfit.id}"
    
    expect(page).to have_content("8")

    visit "/projects/#{@upholstery_tux.id}"
    
    expect(page).to have_content("10")
  end
end