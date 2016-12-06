require_relative '../spec_helper'

describe "When a user wants to delete a trip" do
  it "they press the delete button from the index file" do
    trip = Trip.create(duration: 45,
                      start_date: "2011-3-6 12:00",
                      start_station_id: 1,
                      end_date: "2011-3-6 12:00",
                      end_station_id: 3,
                      bike_id: 3,
                      subscription_id: 1,
                      zipcode: 80211)

    visit "/trips"
    click_on "Delete"

    expect(current_path).to eq("/trips")
    expect(page).to have_content("Total Trips: 0")
  end

  it "they press the delete button from the show file" do
    trip = Trip.create(duration: 45,
                      start_date: "2011-3-6 12:00",
                      start_station_id: 1,
                      end_date: "2011-3-6 12:00",
                      end_station_id: 3,
                      bike_id: 3,
                      subscription_id: 1,
                      zipcode: 80211)
    visit "/trips/#{ trip.id }"
    save_and_open_page
    click_on("Delete")

    expect(current_path).to eq("/trips")
    expect(page).to have_content("Total Trips: 0")
  end
end