require_relative '../spec_helper'

describe "when a user visits /stations" do
  it "they see stations header" do
    visit("/stations")
    
    within("h1") do
      expect(page).to have_content("All Stations")
    end
  end

  it "they can click on a create station button" do
    visit("/stations")

    click_on("Create")
    expect(age).to have_xpath?("//stations/new")

  end
end

# describe "when a users visits /stations/new" do