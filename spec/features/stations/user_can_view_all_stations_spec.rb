require_relative '../../spec_helper'

describe "When a user visits '/stations'" do
  it "they can view all stations" do
    visit '/stations'
    within("h1") do
      expect(page).to have_content("All Stations")
    end
  end
end
