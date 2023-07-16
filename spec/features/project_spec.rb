require 'rails_helper'

RSpec.describe 'Projects', type: :feature do
  describe 'Index' do
    it 'displays a link to challenges, contestant_projects, contestants, and projects' do
      visit projects_path

      expect(page).to have_link('Challenges')
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

    # User Story 3
    it 'displays the number of contestants on the project show page' do
      @challenge1 = Challenge.create!(id: 1, theme: 'Recycled Material', project_budget: 1000)
      @project1 = Project.create!(id: 1, name: 'News Chic', material: 'Newspaper', challenge_id: 1)
      @project2 = Project.create!(id: 2, name: 'Upholstery Tuxedo', material: 'Couch', challenge_id: 1)
      @contestant1 = Contestant.create!(id: 1, name: 'Kentaro Kameyama', age: 32, hometown: 'Denver, CO',
                                        years_of_experience: 10)
      @contestant2 = Contestant.create!(id: 2, name: 'Jay McCarroll', age: 40, hometown: 'Denver, CO',
                                        years_of_experience: 10)

      @contestant1.projects << @project1
      @contestant1.projects << @project2
      @contestant2.projects << @project2

      visit project_path(@project1)
      expect(page).to have_content('Number of Contestants: 1')

      visit project_path(@project2)
      expect(page).to have_content('Number of Contestants: 2')
    end
  end
end
