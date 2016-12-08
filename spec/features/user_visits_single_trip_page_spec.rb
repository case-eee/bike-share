require_relative '../spec_helper'

describe "When a user visits a single trip page" do
  it "shows the trip with the id searched for" do
    trip = Trip.create(duration: 45,
                       start_date: "2011-3-6 12:00",
                       start_station_id: 1,
                       end_date: "2011-3-6 12:00",
                       end_station_id: 3,
                       bike_id: 3,
                       subscription_id: 1,
                       zipcode: 80211)
    visit("/trips/#{ trip.id }")

    expect(page).to have_content("Trip Details")
    expect(page).to have_content("45")
  end

end