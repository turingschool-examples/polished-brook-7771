require 'rails_helper'

RSpec.describe "project show page" do
  before(:each) do
    @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)

    @upholstery_tux = @furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create!(name: "Litfit", material: "Lamp")
  end

  describe "as a visitor" do
    describe "when I visit a project show page" do
      it "I see the theme of the challenge that this project belongs to " do

        visit "/projects/#{@lit_fit.id}"

        expect(page).to have_content("Litfit")
        expect(page).to have_content("Lamp")
        expect(page).to have_content("Apartment Furnishings")
      end
    end
  end
end