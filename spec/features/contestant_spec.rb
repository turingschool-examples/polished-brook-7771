require 'rails_helper'

RSpec.describe 'Contestants', type: :feature do
  describe 'Index' do
    it 'displays a link to challenges, contestant_projects, contestants, and projects' do
      visit contestants_path

      expect(page).to have_link('Challenges')
      expect(page).to have_link('Contestants Projects')
      expect(page).to have_link('Contestants')
      expect(page).to have_link('Projects')
    end

    # User Story 2
    it 'displays a list of all contestants, their attributes, and their projects' do
      @challenge1 = Challenge.create!(id: 1, theme: 'Recycled Material', project_budget: 1000)
      @project1 = Project.create!(id: 1, name: 'News Chic', material: 'Newspaper', challenge_id: 1)
      @project2 = Project.create!(id: 2, name: 'Upholstery Tuxedo', material: 'Couch', challenge_id: 1)
      @contestant1 = Contestant.create!(id: 1, name: 'Kentaro Kameyama', age: 32, hometown: 'Denver, CO',
                                        years_of_experience: 10)
      @contestant1.projects << @project1
      @contestant1.projects << @project2

      visit contestants_path

      expect(page).to have_content(@contestant1.name)
      expect(page).to have_content(@contestant1.age)
      expect(page).to have_content(@contestant1.hometown)
      expect(page).to have_content(@contestant1.years_of_experience)
      expect(page).to have_content(@project1.name)
      expect(page).to have_content(@project2.name)
    end

    it 'displays the contestants attributes and their projects on the contestants show page' do
      @challenge1 = Challenge.create!(id: 1, theme: 'Recycled Material', project_budget: 1000)
      @project1 = Project.create!(id: 1, name: 'News Chic', material: 'Newspaper', challenge_id: 1)
      @project2 = Project.create!(id: 2, name: 'Upholstery Tuxedo', material: 'Couch', challenge_id: 1)
      @contestant1 = Contestant.create!(id: 1, name: 'Kentaro Kameyama', age: 32, hometown: 'Denver, CO',
                                        years_of_experience: 10)
      @contestant1.projects << @project1
      @contestant1.projects << @project2
      visit contestants_path

      click_link 'Kentaro Kameyama'

      expect(current_path).to eq(contestant_path(@contestant1))
      expect(page).to have_content(@contestant1.name)
      expect(page).to have_content(@contestant1.age)
      expect(page).to have_content(@contestant1.hometown)
      expect(page).to have_content(@contestant1.years_of_experience)
      expect(page).to have_content(@project1.name)
      expect(page).to have_content(@project2.name)
    end
  end
end
