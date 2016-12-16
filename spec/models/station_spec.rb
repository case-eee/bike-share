require_relative '../spec_helper'
require 'date'

describe "Station" do
  describe "validates" do
    it "presence of name" do
      invalid_station = Station.new(dock_count: 1, city: "Denver", installation_date: 12/2/2016)

      expect(invalid_station).to_not be_valid
    end
    it "presence of dock count" do
      invalid_station = Station.new(name: "Station 1", city: "Denver", installation_date: 12/2/2016)

      expect(invalid_station).to_not be_valid
    end
    it "presence of city" do
      invalid_station = Station.new(name: "Station 1", dock_count: 1, installation_date: 12/2/2016)

      expect(invalid_station).to_not be_valid
    end
    it "presence of installation date" do
      invalid_station = Station.new(name: "Station 1", dock_count: 1, city: "Denver")

      expect(invalid_station).to_not be_valid
    end
  end
  describe "returns" do
    station = Station.new(name: "Station 1", dock_count: 1, city: "Denver", installation_date: "12/2/2016")
    it "name" do
      expect(station.name).to eq "Station 1"
    end
    it "dock_count" do
      expect(station.dock_count).to eq 1
    end
    it "city" do
      expect(station.city).to eq "Denver"
    end
    it "installation date" do
      expect(station.installation_date).to eq "12/2/2016"
    end
  end
  describe "calculates(class methods)" do
    it "total count of stations" do
      Station.create(name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(name: "Station 2", dock_count: 15, city: "Denver", installation_date: "1/10/2015")
      Station.create(name: "Station 3", dock_count: 20, city: "Denver", installation_date: "17/8/2016")
      Station.create(name: "Station 4", dock_count: 25, city: "Denver", installation_date: "31/12/2015")
      expect(Station.total_stations).to eq 4
    end
    it "average bikes available per station" do
      Station.create(name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(name: "Station 2", dock_count: 15, city: "Denver", installation_date: "1/10/2015")
      Station.create(name: "Station 3", dock_count: 20, city: "Denver", installation_date: "17/8/2016")
      Station.create(name: "Station 4", dock_count: 25, city: "Denver", installation_date: "31/12/2015")
      expect(Station.average_number_of_bikes).to eq 17.5
    end
    it "most bikes available at a station" do
      Station.create(name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(name: "Station 2", dock_count: 15, city: "Denver", installation_date: "1/10/2015")
      Station.create(name: "Station 3", dock_count: 20, city: "Denver", installation_date: "17/8/2016")
      Station.create(name: "Station 4", dock_count: 25, city: "Denver", installation_date: "31/12/2015")
      expect(Station.most_bikes_available).to eq 25
    end
    it "station where the most bikes are available" do
      Station.create(name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(name: "Station 2", dock_count: 15, city: "Denver", installation_date: "1/10/2015")
      Station.create(name: "Station 3", dock_count: 20, city: "Denver", installation_date: "17/8/2016")
      Station.create(name: "Station 4", dock_count: 25, city: "Denver", installation_date: "31/12/2015")
      expect(Station.with_most_bikes.id). to eq 4
    end
    it "fewest bikes available at a station" do
      Station.create(name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(name: "Station 2", dock_count: 15, city: "Denver", installation_date: "1/10/2015")
      Station.create(name: "Station 3", dock_count: 20, city: "Denver", installation_date: "17/8/2016")
      Station.create(name: "Station 4", dock_count: 25, city: "Denver", installation_date: "31/12/2015")
      expect(Station.fewest_bikes_available).to eq 10
    end
    it "station where the fewest bikes are available" do
      Station.create(name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(name: "Station 2", dock_count: 15, city: "Denver", installation_date: "1/10/2015")
      Station.create(name: "Station 3", dock_count: 20, city: "Denver", installation_date: "17/8/2016")
      Station.create(name: "Station 4", dock_count: 25, city: "Denver", installation_date: "31/12/2015")
      expect(Station.with_fewest_bikes.id). to eq 1
    end
    it "oldest station" do
      Station.create(name: "Station 1", dock_count: 10, city: "Denver", installation_date: Date.strptime("11/5/2016", "%m/%d/%Y"))
      Station.create(name: "Station 2", dock_count: 15, city: "Denver", installation_date: Date.strptime("1/10/2015", "%m/%d/%Y"))
      Station.create(name: "Station 3", dock_count: 20, city: "Denver", installation_date: Date.strptime("8/17/2016", "%m/%d/%Y"))
      Station.create(name: "Station 4", dock_count: 25, city: "Denver", installation_date: Date.strptime("12/31/2015", "%m/%d/%Y"))

      expect(Station.oldest_station.name).to eq "Station 2"
    end
    it "newest station" do
      Station.create(name: "Station 1", dock_count: 10, city: "Denver", installation_date: Date.strptime("11/5/2016", "%m/%d/%Y"))
      Station.create(name: "Station 2", dock_count: 15, city: "Denver", installation_date: Date.strptime("1/10/2015", "%m/%d/%Y"))
      Station.create(name: "Station 3", dock_count: 20, city: "Denver", installation_date: Date.strptime("8/17/2016", "%m/%d/%Y"))
      Station.create(name: "Station 4", dock_count: 25, city: "Denver", installation_date: Date.strptime("12/31/2015", "%m/%d/%Y"))

      expect(Station.newest_station.name).to eq "Station 1"
    end
  end
  describe "calculates(instance_methods)" do
    it "number of rides started at this station" do
      station = Station.create(id: 1, name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 2, name: "Station 2", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 3, name: "Station 3", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Trip.create(id: 1, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 2, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 3, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 4, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-08-06 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 5, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)

      expect(station.rides_started).to eq 3
    end
    it "number of rides ended at this station" do
      station = Station.create(id: 1, name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 2, name: "Station 2", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 3, name: "Station 3", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Trip.create(id: 1, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 2, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 3, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 4, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-08-06 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 5, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)

      expect(station.rides_ended).to eq 3
    end
    it "most frequent destination station(started)" do
      station = Station.create(id: 1, name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 2, name: "Station 2", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 3, name: "Station 3", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Trip.create(id: 1, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 2, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 3, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 4, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-08-06 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 5, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)

      expect(station.most_common_destination).to eq "Station 2"
    end
    it "most frequent origination station(ended)" do
      station = Station.create(id: 1, name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 2, name: "Station 2", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 3, name: "Station 3", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Trip.create(id: 1, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 2, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 3, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 4, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-08-06 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 5, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)

      expect(station.most_common_origination).to eq "Station 3"
    end
    it "date with most trips(started)" do
      station = Station.create(id: 1, name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 2, name: "Station 2", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 3, name: "Station 3", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Trip.create(id: 1, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 2, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 3, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 4, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-08-06 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 5, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)

      expect(station.date_with_most_trips_started).to eq Date.strptime("8/29/2013","%m/%d/%Y")
    end
    it "most common zip code (started)" do
      station = Station.create(id: 1, name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 2, name: "Station 2", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 3, name: "Station 3", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Trip.create(id: 1, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 2, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 3, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 4, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-08-06 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 5, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)

      expect(station.most_common_zip_code).to eq "55555"
    end
    it "most common Bike ID (started)" do
      station = Station.create(id: 1, name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 2, name: "Station 2", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Station.create(id: 3, name: "Station 3", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
      Trip.create(id: 1, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 2, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      Trip.create(id: 3, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 4, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-08-06 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 55555)
      Trip.create(id: 5, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
      expect(station.most_common_bike_id).to eq 1
    end
  end

end
