require 'rails_helper'

RSpec.describe 'Challenges', type: :feature do
  describe 'Index' do
    it 'displays a link to challenges, contestant_projects, contestants, and projects' do
      visit contestants_path

      expect(page).to have_link('Challenges')
      expect(page).to have_link('Contestants')
      expect(page).to have_link('Projects')
    end

    it 'displays a list of all challenges and their attributes' do
      @challenge1 = Challenge.create!(id: 1, theme: 'Recycled Material', project_budget: 1000)
      @challenge2 = Challenge.create!(id: 2, theme: 'Apartment Furnishings', project_budget: 2000)

      visit challenges_path

      expect(page).to have_content(@challenge1.theme)
      expect(page).to have_content(@challenge1.project_budget)
    end
  end
end
