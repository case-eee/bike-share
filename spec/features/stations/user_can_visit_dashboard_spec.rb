require_relative '../../spec_helper'

describe "When a user visits '/stations-dashboard" do
  it "all of the statistics for stations are displayed" do
    Station.create(name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
    Station.create(name: "Station 2", dock_count: 15, city: "Denver", installation_date: "1/10/2015")
    Station.create(name: "Station 3", dock_count: 20, city: "Denver", installation_date: "17/8/2016")
    Station.create(name: "Station 4", dock_count: 25, city: "Denver", installation_date: "31/12/2015")
    expect(Station.most_bikes_available).to eq 25
    visit '/stations-dashboard'

    expect(page).to have_content("Stations Dashboard")
    expect(page).to have_content("Total number of stations: 4")
    expect(page).to have_content("Average bikes per station: 17.5")
    expect(page).to have_content("Most bikes available: 25")
    expect(page).to have_content("Station with most bikes: Station 4")
    expect(page).to have_content("Fewest bikes available: 10")
    expect(page).to have_content("Station with fewest bikes: Station 1")
    expect(page).to have_content("Oldest Station: Station 2")
    expect(page).to have_content("Newest Station: ")
  end
end
