describe "when a user visits '/trips/:id'" do
  it "the user should see one trip" do

    trip = Trip.create(id: 4069, duration: 174, start_date: "2013-09-01 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "2013-09-30 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114, created_at: "2016-12-02 23:59:08", updated_at: "2016-12-02 23:59:08")
    visit("/trips/4069")
    expect(page).to have_content("#{trip.id}")
    expect(page).to have_content("#{trip.duration}")
    expect(page).to have_content("#{trip.start_date}")
    expect(page).to have_content("#{trip.start_station_name}")
    expect(page).to have_content("#{trip.start_station_id}")
    expect(page).to have_content("#{trip.end_date}")
    expect(page).to have_content("#{trip.end_station_name}")
    expect(page).to have_content("#{trip.end_station_id}")
    expect(page).to have_content("#{trip.bike_id}")
    expect(page).to have_content("#{trip.subscription_type}")
    expect(page).to have_content("#{trip.zip_code}")
  end
end
