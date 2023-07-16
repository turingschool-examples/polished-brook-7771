require "rails_helper"

RSpec.describe "The Contestants", type: :feature do
  before(:each) do
    test_data
  end
  describe "#index page" do
    it "displays all contestant names and under each name their associated project(s)" do

      visit "/contestants"

      expect(page).to have_content(@jay.name)
      expect(page).to have_content(@jay.projects.pluck(:name))
      expect(page).to have_content(@gretchen.name)
      expect(page).to have_content(@gretchen.projects.pluck(:name))
      expect(page).to have_content(@kentaro.name)
      expect(page).to have_content(@kentaro.projects.pluck(:name))
      expect(page).to have_content(@erin.name)
      expect(page).to have_content(@erin.projects.pluck(:name))

      expect(page).to_not have_content(@jay.projects.pluck(:material))
    end
  end
end