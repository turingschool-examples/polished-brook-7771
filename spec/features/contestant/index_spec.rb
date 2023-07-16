require "rails_helper"

RSpec.describe "user story 2" do
  before(:each) do
    test_data
  end
  describe "the contestant index page" do
    it "displays a list of names of all contestants" do
      visit "/contestants"

      expect(page).to have_content(@jay.name)
      expect(page).to have_content(@gretchen.name)
      expect(page).to have_content(@kentaro.name)
      expect(page).to have_content(@erin.name)
    end

    # it "displays all projects a contestant has done beneath their name" do
    #I don't know how to do this'
    #   visit "/contestants"

    #   expect(page).to have_content(Projects: )
    # end
  end
end