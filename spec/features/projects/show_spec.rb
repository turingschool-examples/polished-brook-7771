require "rails_helper"

RSpec.describe "The Projects", type: :feature do
  before(:each) do
    test_data
  end
  describe "#show page" do
    it "displays the projects name, material, and challenge theme" do
      
      challenge = Challenge.where(id: @news_chic.challenge_id)

      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content(@news_chic.name)
      expect(page).to have_content(@news_chic.material)
      expect(page).to have_content(challenge.first.theme)
      expect(page).to have_content(challenge.first.project_budget)
    end

    it "displays the count of contestants on the project" do

      visit "/projects/#{@boardfit.id}"
      
      expect(page).to have_content(2)
      
    end
  end
end