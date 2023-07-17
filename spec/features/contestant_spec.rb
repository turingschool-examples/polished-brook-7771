require "rails_helper"

RSpec.feature "Contestants", type: :feature do
  it "can see a contestants name and a list of projects they have worked on" do
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)   
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)

    visit "/contestants"

    expect(page).to have_content(jay.name)
    expect(page).to have_content(news_chic.name)

  end
end
