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
end
