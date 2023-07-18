require 'rails_helper'

RSpec.describe "projects show page" do

  before :each do
  @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
  @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

  @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
  @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
  @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

  @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
  @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)


  @cp_1 = ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
  @cp_2 = ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
  @cp_3 = ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
  @cp_4 = ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
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
end