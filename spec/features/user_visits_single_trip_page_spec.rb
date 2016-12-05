require_relative '../spec_helper'

describe "When a user visits a single trip page" do
  it "shows the trip with the id searched for" do
    trip = Trip.create(duration: 45,
                       start_date: "2011-3-6 12:00",
                       start_station: 1,
                       end_date: "2011-3-6 12:00",
                       end_station: 3,
                       bike_id: 3,
                       subscription_id: 1,
                       zipcode: 80211)
    visit("/trips/#{trip.id}")

    expect(page).to have_content("Duration: 45")
  end
end