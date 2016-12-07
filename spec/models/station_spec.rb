require_relative '../spec_helper'

describe 'Station' do

  before do
    City.create(name: "Denver")
  end

  describe 'validates' do
    it 'presence of station name' do
      invalid_station = City.first.stations.create(dock_count: 27, installation_date: "10/6/2015", lat: 37.329732, long: -121.90178200000001)
      expect(invalid_station).to be_invalid
    end

    it 'uniqueness of name' do
      City.first.stations.create(name: "Union", dock_count: 27, installation_date: "10/6/2015", lat: 37.329732, long: -121.90178200000001)
      invalid_station = City.first.stations.create(name: "Union", dock_count: 28, installation_date: "10/8/2015", lat: 39.329732, long: -123.90178200000001)
      expect(invalid_station).to be_invalid
    end

    it 'presence of the dock count' do
      invalid_station = City.first.stations.create(name: "I Like Bike", installation_date: "10/6/2015", lat: 37.329732, long: -121.90178200000001)
      expect(invalid_station).to be_invalid
    end

    it 'presence of a city_id' do
      invalid_station = Station.create(name: "I Like Bike", dock_count: 27, installation_date: "10/6/2015", lat: 37.329732, long: -121.90178200000001)
      expect(invalid_station).to be_invalid
    end

    it 'presence of an installation_date' do
      invalid_station = City.first.stations.create(name: "I Like Bike", dock_count: 27, lat: 37.329732, long: -121.90178200000001)
      expect(invalid_station).to be_invalid
    end

    it 'presence of a latitude' do
      invalid_station = Station.create(name: "I Like Bike", dock_count: 27, installation_date: "10/6/2015", long: -121.90178200000001)
      expect(invalid_station).to be_invalid
    end

    it 'presence of a longitude' do
      invalid_station = Station.create(name: "I Like Bike", dock_count: 27, installation_date: "10/6/2015", lat: 37.329732)
      expect(invalid_station).to be_invalid
    end
  end
end

describe 'Station Methods' do

  before do
    denver = City.create(name: "Denver")
    denver.stations.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, installation_date: "2013-08-06 00:00:00", lat: 37.329732, long: -121.901782)
    denver.stations.create(name: "San Jose Civic Center", dock_count: 15, installation_date: "2013-08-05 00:00:00", lat: 37.330698, long: -121.888979)
    denver.stations.create(name: "Balboa Park Station", dock_count: 6, installation_date: "2014-04-11 00:00:00", lat: 38.335698, long: -122.888009)
  end

  describe "station methods" do
    it "total_station_count returns count of all stations" do
      count = Station.total_station_count
      expect(count).to be_instance_of Fixnum
      expect(count).to eq(3)
    end

    it "average_bikes_per_station returns average number of docks per station" do
      average = Station.average_bikes_per_station
      expect(average).to be_instance_of Fixnum
      expect(average).to eq(16)
    end

    it "maximum_bikes_per_station highest dock number" do
      max = Station.maximum(:dock_count)
      expect(max).to be_instance_of Fixnum
      expect(max).to eq(27)
    end

    it "minimum_bikes_per_station returns lowest dock number" do
      min = Station.minimum_bikes_per_station
      expect(min).to be_instance_of Fixnum
      expect(min).to eq(6)
    end

    it "stations_with_maximum_bikes_available returns stations with most docks" do
      stations = Station.stations_with_maximum_bikes_available
      expect(stations).to be_instance_of Array
      expect(stations).to eq(["San Jose Diridon Caltrain Station"])
    end

    it "stations_with_minimum_bikes_available returns stations with least docks" do
      stations = Station.stations_with_minimum_bikes_available
      expect(stations).to be_instance_of Array
      expect(stations).to eq(["Balboa Park Station"])
    end

    it "newest_station returns station with most recent installation_date" do
      newest = Station.newest_station
      expect(newest).to be_instance_of String
      expect(newest).to eq("Balboa Park Station")
    end

    it "oldest_station returns station with least recent installation date" do
      oldest = Station.oldest_station
      expect(oldest).to be_instance_of String
      expect(oldest).to eq("San Jose Civic Center")
    end



  end
end
