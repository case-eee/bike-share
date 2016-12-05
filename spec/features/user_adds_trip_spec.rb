require_relative '../spec_helper'

describe "When a user visits the new trip path" do
  it "they can create a new trip" do
    visit '/trips/new'

    fill_in 'trips[duration]', with: 45
    fill_in 'trips[start_date]', with: "2013-6-6 3:00"
    fill_in 'trips[start_station_id]', with: 2
    fill_in 'trips[end_date]', with: "2013-6-6 7:30"
    fill_in 'trips[end_station_id]', with: 4
    fill_in 'trips[bike_id]', with: 3
    fill_in 'trips[subscription_id]', with: 1
    fill_in 'trips[zipcode]', with: 80211
    click_on 'Submit'

    new_trip = Trip.find_by(duration: 45)

    expect(current_path).to eq("/trips/#{ new_trip.id }")
    expect(page).to have_content("Duration: 45") 
  end
end