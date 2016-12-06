require_relative '../spec_helper'

describe "When a user visits the new station path" do
  before do
    City.create(name: "Denver")
    City.create(name: "Aurora")
  end

  it "they see a create form" do
    visit '/stations/new'
    expect(page).to have_content("Create a New Station")
    expect(page).to have_field("station[name]")
    expect(page).to have_field("station[dock_count]")
    expect(page).to have_field("station[city_id]")
    expect(page).to have_field("station[lat]")
    expect(page).to have_field("station[long]")
    expect(page).to have_field("station[installation_date]")
    expect(page).to have_button("Create Station")
  end

  it "they can create a new station" do
    visit '/stations/new'
    fill_in 'station[name]', with: "Station Name1"
    find("option[value='1']").select_option
    fill_in 'station[dock_count]', with: 27
    fill_in 'station[lat]', with: 37.330698
    fill_in 'station[long]', with: -121.888979
    fill_in 'station[installation_date]', with: "8/7/2013"
    click_on 'Create Station'
    new_station = Station.find_by(name: "Station Name1")
    expect(current_path).to eq("/stations/#{new_station.id}")
    expect(page).to have_content("Station Name1")
    expect(page).to have_content("Denver")
    expect(page).to have_content("2013-08-07")
  end

end
