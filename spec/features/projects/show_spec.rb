require "rails_helper"

RSpec.describe "project show page" do
  let!(:recycled_material_challenge) { Challenge.create(theme: "Recycled Material", project_budget: 1000) }
  let!(:furniture_challenge) { Challenge.create(theme: "Apartment Furnishings", project_budget: 1000) }
  let!(:news_chic) { recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper") }
  let!(:boardfit) { recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes") }
  let!(:jay) { Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) { Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }
  let!(:contestant_project_1) { ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:contestant_project_2) { ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id) }

  before do
    visit "/projects/#{news_chic.id}"
  end

  it "displays project name and material" do
    expect(page).to have_content(news_chic.name)
    expect(page).to have_content(news_chic.material)
  end

  it "displays challenge theme" do
    expect(page).to have_content(recycled_material_challenge.theme)
  end



end