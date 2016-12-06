require_relative '../spec_helper'

describe "Station" do
  describe "validates" do
    it "presence of name" do
      invalid_station = Station.new(dock_count:3,city_id:2,installation_date:'1999-23-23')

      expect(invalid_station).to_not be_valid
    end

    it "presence of dock_count" do
      invalid_station = Station.new(name:"eric",city_id:2,installation_date:'1999-23-23')

      expect(invalid_station).to_not be_valid
    end

    it "presence of city_id" do
      invalid_station = Station.new(name:"eric",dock_count:2,installation_date:'1999-23-23')

      expect(invalid_station).to_not be_valid
    end

    it "presence of installation_date" do
      invalid_station = Station.new(name:"eric",dock_count:2,city_id:3)

      expect(invalid_station).to_not be_valid
    end

  end
  
  describe ".total_stations" do
    it "returns the total number of stations" do
      Station.create(name:"hi35",dock_count:23,city_id:2,installation_date:'1999-10-23')
      Station.create(name:"david",dock_count:28,city_id:3,installation_date:'1999-10-24')

      expect(Station.total_stations).to eql(2)
    end
  end

  describe ".average_bikes_per_station" do
    it "returns the average number of bikes per station" do
      Station.create(name:"hi35",dock_count:20,city_id:2,installation_date:'1999-10-23')
      Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')

      expect(Station.average_bikes_per_station).to eql(25)
    end
  end

  describe ".max_bikes" do
    it "returns max number of biks at any station" do
      Station.create(name:"hi35",dock_count:20,city_id:2,installation_date:'1999-10-23')
      Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')

      expect(Station.max_bikes).to eql(30)
    end
  end

  describe ".station_with_max_bikes" do
    it "returns the station with the most bikes" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
      david = Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'1999-10-24')

      expect(Station.station_with_max_bikes.first.id).to eql(2)
      expect(Station.station_with_max_bikes.count).to eql(2)
    end
  end

  describe ".min_bikes" do
    it "returns min number of biks at any station" do
      Station.create(name:"hi35",dock_count:20,city_id:2,installation_date:'1999-10-23')
      Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')

      expect(Station.min_bikes).to eql(20)
    end
  end

  describe ".station_with_min_bikes" do
    it "returns the station with the most bikes" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1999-10-24')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'1999-10-24')

      expect(Station.station_with_min_bikes.first.id).to eql(1)
      expect(Station.station_with_min_bikes.count).to eql(2)
    end
  end

  describe ".newest" do
    it "returns the most recently installed station" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'2016-5-24')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')

      expect(Station.newest.first.id).to eql(2)
      expect(Station.newest.count).to eql(2)
    end
  end

  describe ".oldest" do
    it "returns the most recently installed station" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1990-5-23')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')

      expect(Station.oldest.first.id).to eql(1)
      expect(Station.oldest.count).to eql(2)
    end
  end

  describe ".ride_starts" do
    it "returns number of rides started at this station" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1990-5-23')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')
      Trip.create(duration: 20, start_station_id: 1, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 13233, start_date: "11-3-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
  
      expect(Station.ride_starts(1)).to eql(3)
    end
  end

  describe ".ride_ends" do
    it "returns number of rides ended at this station" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1990-5-23')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')
      Trip.create(duration: 20, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 2, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-3-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 3, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
  
      expect(Station.ride_ends(1)).to eql(2)
    end
  end

  describe ".most_frequent_destination" do
    it "returns most frequent destination station (for rides that began at this station)" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1990-5-23')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')
      Trip.create(duration: 20, start_station_id: 1, end_station_id: 3, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 1, end_station_id: 2, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 2, start_date: "11-3-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 3, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 2, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      
      expect(Station.most_frequent_destination(1)).to eql(2)
    end
  end

  describe ".most_frequent_orgin" do
    it "returns most frequent origination station (for rides that ended at this station)" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1990-5-23')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')
      Trip.create(duration: 20, start_station_id: 3, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 2, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 2, end_station_id: 1, start_date: "11-3-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 3, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 2, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      
      expect(Station.most_frequent_origin(1)).to eql(2)
    end
  end

  describe '.most_frequent_zip ' do
    it 'returns the most frequent zip code for users starting trips at this station' do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1990-5-23')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')
      Trip.create(duration: 20, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 10221)
      Trip.create(duration: 40, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 10221)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-3-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 10221)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 10223)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 10223)
      
      expect(Station.most_frequent_zip(1)).to eql(10221)
    end
  end

  describe '.most_frequent_bike_id' do
    it 'returns bike ID most frequently starting a trip at this station' do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1990-5-23')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')
      Trip.create(duration: 20, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 21, subscription_type: "Subcriber", zip_code: 10221)
      Trip.create(duration: 40, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 21, subscription_type: "Subcriber", zip_code: 10221)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-3-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 21, subscription_type: "Subcriber", zip_code: 10221)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 22, subscription_type: "Subcriber", zip_code: 10223)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 22, subscription_type: "Subcriber", zip_code: 10223)
    
      expect(Station.most_frequent_bike_id(1)).to eql(21)
    end
  end

  describe '.most_trips' do
    it 'returns date with the highest number of trips started at this station.' do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1990-5-23')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')
      Trip.create(duration: 20, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 21, subscription_type: "Subcriber", zip_code: 10221)
      Trip.create(duration: 40, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 21, subscription_type: "Subcriber", zip_code: 10221)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-4-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 21, subscription_type: "Subcriber", zip_code: 10221)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-5-2015 14:44", end_date: "11-3-2014 14:55", bike_id: 22, subscription_type: "Subcriber", zip_code: 10223)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-6-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 22, subscription_type: "Subcriber", zip_code: 10223)
    
      expect(Station.most_trips(1).to_s).to eql("2014-03-11")
    end
  end

  end

# Date with the highest number of trips started at this station.



