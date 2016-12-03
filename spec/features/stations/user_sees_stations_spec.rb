require_relative '../../spec_helper'

describe "when a user visits /stations" do
  it "they see stations header" do
    visit "/stations"

    within "h1" do
      expect(page).to have_content "All Stations"
    end
  end

  it "they can click on a create station button" do
    visit "/stations"

    click_on "Create"
    expect(page).to have_current_path "/stations/new"
  end
end
