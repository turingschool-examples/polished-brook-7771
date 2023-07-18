require "rails_helper"

RSpec.describe "Projects 'show' Page", type: :feature do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

  end

  describe "As a visitor" do
    it "I see that project's name and material" do
      visit "/projects/#{@boardfit.id}"

      expect(page).to have_content(@boardfit.name)
      expect(page).to have_content(@boardfit.material)
    end

    it "I also see the theme of the challenge that this project belongs to" do
      visit "/projects/#{@boardfit.id}"

      expect(page).to have_content("This Theme's Challenge: Recycled Material")
    end

  end

end