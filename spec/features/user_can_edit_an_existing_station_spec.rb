require_relative '../spec_helper'

describe "when a user visits '/stations/1/edit'" do
  it "they can edit station information" do
    City.create(name: "Denver")
    City.first.stations.create(name: "I Like Bike", dock_count: 27, installation_date: "10/6/2015")
    visit '/stations/1/edit'
    fill_in 'station[name]', with: "TestStationOne"
    fill_in 'station[dock_count]', with: 15
    fill_in 'station[installation_date]', with: "22/9/2016"

    click_on 'Edit'

    station = Station.find_by(id: 1)
    expect(current_path).to eq("/stations/#{station.id}")
    expect(page).to have_content("TestStationOne")
    expect(page).to have_content("2016-09-22")
  end
end
