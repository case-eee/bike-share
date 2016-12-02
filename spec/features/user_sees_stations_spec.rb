require_relative '../spec_helper'

describe "when a user visits /stations" do
  it "they see stations header" do
    visit("/stations")
    
    within("h1") do
      expect(page).to have_content("All Stations")
    end
  end
end