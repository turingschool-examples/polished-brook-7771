require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  describe 'Index' do
    it 'displays a link to challenges, contestant_projects, contestants, and projects' do
      visit root_path

      expect(page).to have_link('Challenges')
      expect(page).to have_link('Contestants')
      expect(page).to have_link('Projects')
    end
  end
end
