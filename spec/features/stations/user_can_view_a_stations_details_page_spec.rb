require_relative '../../spec_helper'

describe "When a user visits '/stations/id_number/details'" do
  it "they can view detailed information" do
    station = Station.create(id: 1, name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
    Station.create(id: 2, name: "Station 2", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
    Station.create(id: 3, name: "Station 3", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
    Trip.create(id: 1, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
    Trip.create(id: 2, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
    Trip.create(id: 3, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 55555)
    Trip.create(id: 4, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-08-06 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 55555)
    Trip.create(id: 5, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)

    visit '/stations/1'
    click_on "Details"

    expect(current_path).to eq('/stations/1/detailed')

    expect(page).to have_content("Number of rides started at this station: 3")
    expect(page).to have_content("Number of rides ended at this station: 3")
    expect(page).to have_content("Most common destination station: Station 2")
    expect(page).to have_content("Most common origination station: Station 3")
    expect(page).to have_content("Date with most trips: 2013-08-29")
    expect(page).to have_content("Most common zip code: 55555")
    expect(page).to have_content("Most common bike ID: 1")
  end
end
