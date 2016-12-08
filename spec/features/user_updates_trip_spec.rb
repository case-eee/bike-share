require_relative '../spec_helper'

describe "When a user visits the edit trip page" do

  it "they see the update form" do
    Subscription.create(name: "Subcriber")
    trip = Trip.create(duration: 45,
                      start_date: "2011-3-6 12:00",
                      start_station_id: 1,
                      end_date: "2011-3-6 12:00",
                      end_station_id: 3,
                      bike_id: 3,
                      subscription_id: 1,
                      zipcode: 80211)
    visit "/trips/#{ trip.id }/edit" 

    expect(page).to have_content("Edit Trip")
    expect(page).to have_content("Duration")
  end

  it "allows them to update the trip" do
    Subscription.create(name: "Subcriber")
    trip = Trip.create(duration: 45,
                      start_date: "2011-3-6 12:00",
                      start_station_id: 1,
                      end_date: "2011-3-6 12:00",
                      end_station_id: 3,
                      bike_id: 3,
                      subscription_id: 1,
                      zipcode: 80211)
    
    visit "/trips/#{ trip.id }/edit"
    fill_in "trips[duration]", with: 47
    click_on "Update"

    expect(current_path).to eq("/trips/#{ trip.id }")
    expect(page).to have_content("47")
  end

  describe "from the index" do
    it "they can update the trip" do
      Subscription.create(name: "Subcriber")
      trip = Trip.create(duration: 45,
                      start_date: "2011-3-6 12:00",
                      start_station_id: 1,
                      end_date: "2011-3-6 12:00",
                      end_station_id: 3,
                      bike_id: 3,
                      subscription_id: 1,
                      zipcode: 80211)
    
      visit "/trips"
      click_on "Update"
    end
  end

  describe "from the show page" do
    it "they can update the trip" do
    
    end
  end

end