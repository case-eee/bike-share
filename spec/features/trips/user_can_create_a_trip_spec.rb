describe "when a user visits '/trips/new'" do
  it "when the user should be able create a new trip" do
    visit("/trips/new")

    expect(page).to have_content("Create a New Trip")
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

    expect(Trip.first.id).to eq(1)
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

    expect(current_path).to eql('/trips')
  end
end
