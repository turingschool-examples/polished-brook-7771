require "rails_helper"
#User story 1
RSpec.describe "the projects show page" do
  it "displays the project name and material" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    
    visit "/projects/#{news_chic.id}"

    expect(page).to have_content(news_chic.name)
    expect(page).to have_content(news_chic.material)

  end

  it "displays the theme of the challenge this project belongs to" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    visit "/projects/#{news_chic.id}"
    
    expect(page).to have_content(recycled_material_challenge.theme)
  end
end