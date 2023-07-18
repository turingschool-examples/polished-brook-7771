require "rails_helper"

RSpec.describe "Projects Show Page ('/projects/:id')", type: :feature do
  describe "As a visitor," do
    describe "When I visit a project's show page ('/projects/:id')" do
      it "I see that project's name and material" do
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

        visit "/projects/#{news_chic.id}"

        expect(page).to have_content(news_chic.name)
        expect(page).to have_content("Material: #{news_chic.material}")
      end


      it "and I also see the theme of the challenge that this project belongs to." do
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

        visit "/projects/#{news_chic.id}"

        expect(page).to have_content(recycled_material_challenge.theme)
      end
    end
  end


end