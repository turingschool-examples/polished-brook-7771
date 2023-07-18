require 'rails_helper'

RSpec.describe 'Project Show Page' do
  describe 'As a visitor' do
    describe 'When I visit a project show page' do
      it "I see that project's name and material" do 
        
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        
        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

        visit "/projects/#{boardfit.id}"

        expect(page).to have_content(@project.name)
        # expect(page).to have_content(@project.material)
      end
    end
  end
end