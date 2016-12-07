require_relative '../../spec_helper'

describe "When a user visits '/stations/new'" do
  it "they can create a new station" do
    visit '/stations/new'

    within "h1" do
      expect(page).to have_content("New Station")
    end

    fill_in "station[name]", with: "Station 1"
    fill_in "station[dock_count]", with: "1"
    fill_in "station[city]", with: "Denver"
    fill_in "station[installation_date]", with: "12/2/2016"
    click_on "Submit"

    station = Station.find_by(name: "Station 1")
    expect(station).to be_valid

    expect(current_path).to eq("/stations/#{station.id}")
    expect(page).to have_content("Station 1")
  end
end
