require "rails_helper"

RSpec.describe Contestant, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe '#project_names' do
    it 'returns a list of project names' do 
      challenge_1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      contestant_1 = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      project_1 = contestant_1.projects.create!(name: "News Chic", material: "Newspaper", challenge: challenge_1)
      project_2 = contestant_1.projects.create!(name: "Upholstery Tuxedo", material: "Couch", challenge: challenge_1)

      expected_project_names = "#{project_1.name}, #{project_2.name}"
      expect(contestant_1.project_names).to eq(expected_project_names)
    end
  end


end
