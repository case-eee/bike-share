require_relative '../../spec_helper'

describe "when a user visits station/new" do
  it "they can create a new station" do
    visit "/stations/new"

    fill_in "station[name]", :with => "Dock_1"
    fill_in "station[dock_count]", :with => 1
    fill_in "station[city_id]", :with => 1
    fill_in "station[installation_date]", :with => "11/4/2016"

    click_on("Create Station")

    expect(current_path).to eql "/stations"
    expect(page).to have_content "Dock_1"
  end
end
