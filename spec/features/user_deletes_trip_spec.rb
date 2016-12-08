require_relative '../spec_helper'

describe "When a user wants to delete a trip" do
  it "they press the delete button from the index file" do
    Station.write(name: "TestStation1",
              lat: 1.1,
              long: 1.2,
              dock_count: 2,
              city_name: "TestCityName1",
              installation_date: "2011-11-11")
    Station.write(name: "TestStation3",
              lat: 1.1,
              long: 1.2,
              dock_count: 3,
              city_name: "TestCityName3",
              installation_date: "2011-11-11")
    trip = Trip.write(duration: 45,
                      start_date: "2011-3-6 12:00",
                      start_station_name: "TestStation1",
                      end_date: "2011-3-6 12:00",
                      end_station_name: "TestStation3",
                      bike_id: 3,
                      subscription_type: "Subscriber",
                      zipcode: 80211)

    visit "/trips"
    click_on("Delete")

    expect(current_path).to eq("/trips")
    expect(page).to have_content("Total Trips: 0")
  end

  it "they press the delete button from the show file" do
    Station.write(name: "TestStation1",
              lat: 1.1,
              long: 1.2,
              dock_count: 2,
              city_name: "TestCityName1",
              installation_date: "2011-11-11")
    Station.write(name: "TestStation3",
              lat: 1.1,
              long: 1.2,
              dock_count: 3,
              city_name: "TestCityName3",
              installation_date: "2011-11-11")
    trip = Trip.write(duration: 45,
                      start_date: "2011-3-6 12:00",
                      start_station_name: "TestStation1",
                      end_date: "2011-3-6 12:00",
                      end_station_name: "TestStation3",
                      bike_id: 3,
                      subscription_type: "Subscriber",
                      zipcode: 80211)

    visit "/trips/#{ trip.id }"
    click_on("Delete")

    expect(current_path).to eq("/trips")
    expect(page).to have_content("Total Trips: 0")
  end
end