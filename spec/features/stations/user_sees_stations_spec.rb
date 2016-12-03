require_relative '../../spec_helper'

describe "when a user visits /stations" do
  it "they see stations header" do
    visit "/stations"

    within "h1:nth-of-type(1)" do
      expect(page).to have_content "All Stations"
    end
  end

  it "they can click on a create station button" do
    visit "/stations"

    click_on "Create"
    expect(page).to have_current_path "/stations/new"
  end

  it "they can delete an existing station" do
    Station.create(name:"hi35",dock_count:23,city_id:2,installation_date:'1999-23-23')
    visit "/stations"

    expect(page).to have_content("hi35")
    click_on "Delete Station : hi35"

    expect(page).to have_current_path "/stations"
    expect(page).not_to have_content("hi35")
  end
end
