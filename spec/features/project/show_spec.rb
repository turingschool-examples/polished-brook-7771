require "rails_helper"

RSpec.describe "project show page" do
  before(:each) do
    test_data
  end

  it "should display project name and material on show page" do
    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content(@upholstery_tux.name)
    expect(page).to have_content(@upholstery_tux.material)

    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content(@news_chic.name)
    expect(page).to have_content(@news_chic.material)
  end
  
  # it "should display theme of challenge the project belongs to" do
  #   visit "/projects/#{@boardfit.id}"
  #   expect(page).to have_content(@recycled_material_challenge.theme)
  # end
end