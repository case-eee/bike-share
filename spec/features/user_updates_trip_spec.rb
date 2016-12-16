require_relative '../spec_helper'

describe "When a user visits the edit trip page" do

  it "they see the update form" do
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

    visit "/trips/#{ trip.id }/edit" 

    expect(page).to have_content("Edit Trip")
    expect(page).to have_content("Duration")
  end

  it "allows them to update the trip" do
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
    
    visit "/trips/#{ trip.id }/edit"
    fill_in "trips[duration]", with: 47
    click_on "Update"

    expect(current_path).to eq("/trips/#{ trip.id }")
    expect(page).to have_content("47")
  end

  describe "from the index" do
    it "they can update the trip" do
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
        click_on "Update"

      expect(current_path).to eq("/trips/#{ trip.id }/edit")
    end
  end

  describe "from the show page" do
    it "they can visit edit page" do
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

        visit "/trips/#{trip.id}"
        click_on "Update"

      expect(current_path).to eq("/trips/#{ trip.id }/edit")
    end
  end

end