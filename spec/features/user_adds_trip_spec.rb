require 'pry'
require_relative '../spec_helper'

describe "When a user visits the new trip path" do
  it "they can create a new trip" do
    Station.write(name: "Station1",
                  dock_count: 7,
                  city_name: "Denver",
                  installation_date: "2013-11-12")
    
    visit '/trips/new'

    fill_in 'trips[duration]', with: 45
    fill_in 'trips[start_date]', with: "2013-6-6"
    fill_in 'trips[start_station_name]', with: "TestStation1"
    fill_in 'trips[end_date]', with: "2013-6-6"
    fill_in 'trips[end_station_name]', with: "TestStaton2"
    fill_in 'trips[bike_id]', with: 3
    fill_in 'trips[subscription_name]', with: "Subscriber"
    fill_in 'trips[zipcode]', with: 80211
    click_on 'Submit'

    new_trip = Trip.find_by(duration: 45)

    expect(current_path).to eq("/trips/#{ new_trip.id }")
    expect(page).to have_content("45") 
  end

end