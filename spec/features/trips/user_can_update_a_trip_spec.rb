describe "when a user visits '/trips/edit'" do
  it "the user should be able to update a trip" do
    Trip.create(id: 4069, duration: 174, start_date: "2013-09-01 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "2013-09-30 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114, created_at: "2016-12-02 23:59:08", updated_at: "2016-12-02 23:59:08")

    visit("/trips/#{Trip.first.id}/edit")

    expect(page).to have_content("Update")
    fill_in("duration", with: "100")
    fill_in("start_date", with: "2013-09-01 00:00:00 UTC")
    fill_in("start_station_name", with: "Union Station")
    fill_in("start_station_id", with: "1111")
    fill_in("end_date", with: "2013-09-30 00:00:00 UTC")
    fill_in("end_station_name", with: "Auraria")
    fill_in("end_station_id", with: "100")
    fill_in("bike_id", with: "12")
    fill_in("subscription_type", with: "Subscriber")
    fill_in("zip_code", with: "80212")
    click_on("submit_trip")

    expect(Trip.first.id).to eq(4069)
    expect(Trip.first.duration).to eq(100)
    expect(Trip.first.start_date).to eq("2013-09-01 00:00:00 UTC")
    expect(Trip.first.start_station_id).to eq(1111)
    expect(Trip.first.start_station_name).to eq('Union Station')
    expect(Trip.first.end_date).to eq("2013-09-30 00:00:00 UTC")
    expect(Trip.first.end_station_name).to eq("Auraria")
    expect(Trip.first.end_station_id).to eq(100)
    expect(Trip.first.bike_id).to eq(12)
    expect(Trip.first.subscription_type).to eq("Subscriber")
    expect(Trip.first.zip_code).to eq(80212)

    expect(current_path).to eql('/trips/4069')
  end

  it "the user should also be able to delete a trip" do
    Trip.create(id: 4069, duration: 174, start_date: "2013-09-01 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "2013-09-30 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114, created_at: "2016-12-02 23:59:08", updated_at: "2016-12-02 23:59:08")

    visit("/trips/#{Trip.first.id}/edit")

    click_on("delete_trip")
  end
end
