require_relative '../spec_helper'

describe "When a user visits '/stations'" do
  it "they see all the stations" do
    visit('/stations')

    expect(page).to have_content("All Stations")
  end
end

describe "When a user visits the new stations path" do
  it "they can create a new station" do
    visit '/stations/new'

    fill_in 'stations[name]', with: "StationTest1"
    fill_in 'stations[dock_count]', with: 1
    fill_in 'stations[city_id]', with: "San Francisco"
    fill_in 'stations[installation_date]', with: "2011-11-11"
    click_on 'Submit'

    station1 = Station.find_by(name: "StationTest1")
    expect(page).to have_content("StationTest1")
    expect(current_path).to eq("/stations/#{ station1.id }")
  end
end

describe "When a user visits a stations id path" do
  it "they can see the station page" do

    station1 = Station.write(name: "StationTest1", dock_count: 1, city_name: "San Diego", installation_date: "2011-11-11")
    visit "/stations/#{ station1.id }"

    expect(page).to have_content("StationTest1")
  end
end
