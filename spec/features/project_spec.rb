require 'rails_helper'

RSpec.describe 'Projects', type: :feature do
  describe 'Index' do
    it 'displays a link to challenges, contestant_projects, contestants, and projects' do
      visit projects_path

      expect(page).to have_link('Challenges')
      expect(page).to have_link('Contestants Projects')
      expect(page).to have_link('Contestants')
      expect(page).to have_link('Projects')
    end

    it 'displays a list of all projects with their material' do
      @challenge1 = Challenge.create!(id: 1, theme: 'Recycled Material', project_budget: 1000)
      @project1 = Project.create!(id: 1, name: 'News Chic', material: 'Newspaper', challenge_id: 1)
      visit projects_path

      expect(page).to have_content(@project1.name)
      expect(page).to have_content(@project1.material)
    end

    # User Story 1
    it 'displays the projects name and materials on the projects show page' do
      @challenge1 = Challenge.create!(id: 1, theme: 'Recycled Material', project_budget: 1000)
      @project1 = Project.create!(id: 1, name: 'News Chic', material: 'Newspaper', challenge_id: 1)
      visit projects_path
      click_link 'News Chic'

      expect(current_path).to eq(project_path(@project1))
      expect(page).to have_content(@project1.name)
      expect(page).to have_content(@project1.material)
      expect(page).to have_content(@challenge1.theme)
    end
  end
end
