require_relative '../../spec_helper'

describe 'trips' do
  describe "when a user visits '/trips-dashboard'" do
    it "displays the average duration of a ride" do
      Trip.create(duration: 63.0, start_date: "2013-08-29 00:00:00", start_station_name: "South Van Ness at Market", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 520.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

      Trip.create(duration: 70.0, start_date: "2013-08-29 00:00:00", start_station_name: "San Jose City Hall", start_station_id: 10.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

      Trip.create(duration: 71.0, start_date: "2013-08-29 00:00:00", start_station_name: "Mountain View City Hall", start_station_id: 27.0, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

      expect(Trip.all.count).to eq(3)
      visit('/trips-dashboard')
    end
  end
end
