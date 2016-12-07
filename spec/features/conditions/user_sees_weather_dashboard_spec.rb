require_relative '../../spec_helper'

describe '/weather-dashboard' do
  describe "when a user visits weather-dashboard" do
    describe "user sees trip information by temperature" do
      it "user sees average number of rides for temperature chunks" do
        Condition.create(date: '2013-09-01 00:00:00 UTC', precipitation_inches: 5,
                         max_temperature_f: 50, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 10,
                         mean_wind_speed_mph: 20, mean_humidity: 20,
                         zip_code: 94107)

        Trip.create(id: 4069, duration: 174,
                    start_date: "2013-09-01 00:00:00 UTC",
                    start_station_name: "2nd at South Park",
                    start_station_id: 64, end_date: "2013-09-30 00:00:00 UTC",
                    end_station_name: "2nd at South Park", end_station_id: 64,
                    bike_id: 288, subscription_type: "Subscriber",
                    zip_code: 94114, created_at: "2016-12-02 23:59:08",
                    updated_at: "2016-12-02 23:59:08")

        visit('/weather-dashboard')

        within "h1" do
          expect(page).to have_content("Weather Dashboard")
        end
      end
    end
  end
end
