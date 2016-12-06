require_relative '../../spec_helper'

describe "When a user visits '/stations/'" do
  it "they can delete a station" do
    station = Station.create(name: "Station 1", dock_count: 1, city: "Denver", installation_date: "1/2/2014" )

    visit '/stations'
    expect(page).to have_content("Station 1")

    click_on "Delete"
    
    expect(current_path).to eq("/stations")
    expect(page).to have_no_content("Station 1")
  end
end

describe "When a user visits '/stations/id_number" do
  it "they can delete that station" do
    station = Station.create(name: "Station 1", dock_count: 1, city: "Denver", installation_date: "1/2/2014" )

    visit '/stations'
    expect(page).to have_content("Station 1")

    visit "/stations/#{station.id}"
    click_on "Delete"

    expect(current_path).to eq("/stations")
    expect(page).to have_no_content("Station 1")
  end
end
