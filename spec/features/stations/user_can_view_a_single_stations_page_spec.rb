require_relative '../../spec_helper'

describe "When a user visits '/stations/id_number" do
  it "they can see the that stations's basic info" do
    Station.create(name: "Station 1", dock_count: 5, city: "Denver", installation_date: "12/2/2016")
    Trip.create(duration: 2,
                start_date: Date.strptime("12/2/2016)", "%m/%d/%Y"),
                start_station_name: "Station 1",
                start_station_id: 1,
                end_date: Date.strptime("12/2/2016", "%m/%d/%Y"),
                end_station_name: "Station 1",
                end_station_id: 1,
                bike_id: 1,
                subscription_type: "Subscriber",
                zip_code: "94107")

    visit '/stations/1'

    within "h1" do
      expect(page).to have_content("Station 1")
    end

    expect(page).to have_content("Dock Count: 5")
    expect(page).to have_content("City: Denver")
    expect(page).to have_content("Installation Date: 2016-02-12")


  end
end
