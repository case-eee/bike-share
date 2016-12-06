require_relative '../spec_helper'

describe "when a user visits '/stations/1/edit'" do
  before do
    City.create(name: "Denver")
    City.create(name: "Aurora")
    City.first.stations.create(name: "I Like Bike", dock_count: 27, installation_date: "2015/10/6", lat: 37.330698, long: -121.888979)
    # require 'pry'; binding.pry    
  end

  it "they see a create form" do
    visit '/stations/1/edit'
    expect(page).to have_content("Edit Station Information")
    expect(page).to have_field("station[name]")
    expect(page).to have_field("station[dock_count]")
    expect(page).to have_field("station[city_id]")
    expect(page).to have_field("station[lat]")
    expect(page).to have_field("station[long]")
    expect(page).to have_field("station[installation_date]")
    expect(page).to have_button("Edit")
  end

  it 'and they can see the existing station information in the form' do
    expect(find_field('station[name]').value).to eq("I Like Bike")
    expect(find_field('station[dock_count]').value).to eq("27")
    expect(find_field('station[city_id]').value).to eq("1")
    expect(find_field('station[lat]').value).to eq("37.330698")
    expect(find_field('station[long]').value).to eq("-121.888979")
    expect(find_field('station[installation_date]').value).to eq("2015-10-06 00:00:00 UTC")
  end

  it "they can edit station information" do
    station = Station.find_by(id: 1)
    
    visit '/stations/1/edit'
    fill_in 'station[name]', with: "TestStationOne"
    fill_in 'station[lat]', with: 36.330698
    fill_in 'station[long]', with: -120.888979
    find("option[value='2']").select_option
    fill_in 'station[dock_count]', with: 15
    fill_in 'station[installation_date]', with: "22/9/2016"
    click_on 'Edit'

    expect(current_path).to eq("/stations/#{station.id}")
    expect(page).to have_content("TestStationOne")
    expect(page).to have_content("2016-09-22")
    expect(page).to have_content(36.330698)
    expect(page).to have_content(-120.888979)
  end
end
