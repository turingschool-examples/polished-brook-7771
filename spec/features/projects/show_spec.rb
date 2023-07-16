require "rails_helper"

RSpec.describe "Project show page" do
  before do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
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
    save_and_open_page
  end
end