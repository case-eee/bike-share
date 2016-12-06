require_relative '../spec_helper'

describe "When a user visits /trips" do
  it "they see the total count of trips" do
    Subscription.create(name: "Subscriber")
    trip = Trip.write(duration: 45,
                       start_date: "2011-3-6 12:00",
                       start_station_id: 1,
                       end_date: "2011-3-6 12:00",
                       end_station_id: 3,
                       bike_id: 3,
                       subscription_id: 1,
                       zipcode: 80211)

    visit '/trips'

    expect(page).to have_content("Total Trips: 1")
  end

  it "they see only the first 30 trips" do 
    Subscription.create(name: "Subscriber")
    x = 1
    32.times do 
      trip = Trip.write(duration: x,
                       start_date: "2011-3-6 12:00",
                       start_station_id: 1,
                       end_date: "2011-3-6 12:00",
                       end_station_id: 3,
                       bike_id: 3,
                       subscription_id: 1,
                       zipcode: 80211)
      x += 1
    end
    visit '/trips'
    
    expect(page).to_not have_content("31")
  end

  it "they can see the next 30 trips" do
    x = 1
    32.times do 
      trip = Trip.write(duration: x,
                       start_date: "2011-3-6 12:00",
                       start_station_id: 1,
                       end_date: "2011-3-6 12:00",
                       end_station_id: 3,
                       bike_id: 3,
                       subscription_id: 1,
                       zipcode: 80211)
      x += 1
    end
    visit '/trips'
    click_on("Next")
    
    expect(page).to have_content("31")
  end

  it "they can navagate forward and backward through trips" do
    x = 1
    32.times do 
      trip = Trip.write(duration: x,
                       start_date: "2011-3-6 12:00",
                       start_station_id: 1,
                       end_date: "2011-3-6 12:00",
                       end_station_id: 3,
                       bike_id: 3,
                       subscription_id: 1,
                       zipcode: 80211)
      x += 1
    end
    visit '/trips'
    
    expect(page).to have_content("30")
    expect(page).to_not have_content("31")
    click_on("Next")
  
    expect(page).to have_content("31")
    click_on("Previous")

    expect(page).to have_content("30")
  end

end