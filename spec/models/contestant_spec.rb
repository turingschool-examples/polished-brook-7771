require "rails_helper"

RSpec.describe Contestant, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    #none of these are working. No associations?
    it {should have_many :challenges}
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:challenges)}
  end
end
