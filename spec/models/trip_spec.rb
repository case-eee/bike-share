require_relative '../spec_helper'

describe "Trip" do 
  describe "Validates" do
    it "presence of duration" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  end_station_id: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  end_date: "11-3-2014 14:55", 
                                  bike_id: 23, 
                                  subscription_type: "Subcriber", 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of start_station_id" do
      invalid_trip = Trip.create( duration: 14242, 
                                  end_station_id: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  end_date: "11-3-2014 14:55", 
                                  bike_id: 23, 
                                  subscription_type: "Subcriber", 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of end_station_id" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  duration: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  end_date: "11-3-2014 14:55", 
                                  bike_id: 23, 
                                  subscription_type: "Subcriber", 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of start_date" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  end_station_id: 13233, 
                                  duration: 4, 
                                  end_date: "11-3-2014 14:55", 
                                  bike_id: 23, 
                                  subscription_type: "Subcriber", 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of end_date" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  end_station_id: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  duration: 44, 
                                  bike_id: 23, 
                                  subscription_type: "Subcriber", 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of bike_id" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  end_station_id: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  end_date: "11-3-2014 14:55", 
                                  duration: 23, 
                                  subscription_type: "Subcriber", 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of subscription_type" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  end_station_id: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  end_date: "11-3-2014 14:55", 
                                  bike_id: 23, 
                                  duration:3, 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of zip_code" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  end_station_id: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  end_date: "11-3-2014 14:55", 
                                  bike_id: 23, 
                                  subscription_type: "Subcriber", 
                                  duration: 1029)

      expect(invalid_trip).to_not be_valid
    end
  end


  describe ".average_trip_duration" do
    it "returns the average trip duration" do
      Trip.create(duration: 20, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    

      expect(Trip.average_trip_duration).to eql(30)
    end
  end

  describe ".longest_ride" do
    it "returns the longest ride out of all trips" do
      Trip.create(duration: 20, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)

      expect(Trip.longest_ride).to eql(40.0)
    end
  end

  describe ".shortest_ride" do
    it "returns the shortest ride out of all trips" do
      Trip.create(duration: 20, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)

      expect(Trip.shortest_ride).to eql(20.0)
    end
  end

  describe ".most_starting_rides_station" do
    it "returns the station with the most starting rides" do
      Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Station.create(name:"paul",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Station.create(name:"paul",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 13233, start_date: "11-3-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      
      expect(Trip.most_starting_rides_station.id).to eql(1)
    end
  end

  describe ".most_ending_rides_station" do
    it "returns the station with the most ending rides" do
      Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Station.create(name:"paul",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Station.create(name:"paul",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-3-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      
      expect(Trip.most_ending_rides_station.id).to eql(1)
    end
  end

  # describe ".number_of_rides_by_month" do
  #   xit "returns month by month breakdown of number of rides with subtotals of each year" do
  #     Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
  #     Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)      
  #     Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "6-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
  #     Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
  #     Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)

  #     expect(Trip.number_of_rides_by_month(2014)).to eql(4)
  #     expect(Trip.number_of_rides_by_month(2014).last).to eql(1)
  #     expect(Trip.number_of_rides_by_month(2014)[1]).to eql(2)
      
  #   end
  # end

  describe ".most_ridden_bike" do
    it "returns the most ridden bike with the total number of rides for that bike" do
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)      
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "6-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subcriber", zip_code: 1029)
    
      expect(Trip.most_ridden_bike.count).to eql(2)
      expect(Trip.most_ridden_bike.first.last).to eql(2)
      
    end
  end

  describe ".least_ridden_bike" do
    it "returns the least ridden bike with the total number of rides for that bike" do
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)      
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "6-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 21, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 22, subscription_type: "Subcriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subcriber", zip_code: 1029)
    
      expect(Trip.least_ridden_bike.count).to eql(3)
      expect(Trip.least_ridden_bike.first.last).to eql(1)
      
    end
  end

  describe '.user_count' do
    it "returns user subscription type breakout with both count and percentage" do
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)      
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "6-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 21, subscription_type: "Baller", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 22, subscription_type: "Baller", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Baller", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "OG", zip_code: 1029)

      expect(Trip.user_count.count).to eql(3)
      expect(Trip.user_count["OG"].first).to eql(1)
      expect(Trip.user_count["OG"].last).to eql(16.67)
      
    end
  end

  describe '.most_frequent_zip '
    it 'returns the most frequent zip code for users starting trips at this station.'



  # describe ".station_with_max_bikes" do
  #   it "returns the station with the most bikes" do
  #     eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
  #     david = Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
  #     nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'1999-10-24')

  #     expect(Station.station_with_max_bikes.first.id).to eql(2)
  #     expect(Station.station_with_max_bikes.count).to eql(2)
  #   end
  # end

  # describe ".min_bikes" do
  #   it "returns min number of biks at any station" do
  #     Station.create(name:"hi35",dock_count:20,city_id:2,installation_date:'1999-10-23')
  #     Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')

  #     expect(Station.min_bikes).to eql(20)
  #   end
  # end

  # describe ".station_with_min_bikes" do
  #   it "returns the station with the most bikes" do
  #     eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-10-23')
  #     david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1999-10-24')
  #     nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'1999-10-24')

  #     expect(Station.station_with_min_bikes.first.id).to eql(1)
  #     expect(Station.station_with_min_bikes.count).to eql(2)
  #   end
  # end

  # describe ".newest" do
  #   it "returns the most recently installed station" do
  #     eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
  #     david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'2016-5-24')
  #     nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')

  #     expect(Station.newest.first.id).to eql(2)
  #     expect(Station.newest.count).to eql(2)
  #   end
  # end

  # describe ".oldest" do
  #   it "returns the most recently installed station" do
  #     eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
  #     david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1990-5-23')
  #     nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')

  #     expect(Station.oldest.first.id).to eql(1)
  #     expect(Station.oldest.count).to eql(2)
  #   end
  # end

end

# Average duration of a ride.
# Longest ride.
# Shortest ride.
# Station with the most rides as a starting place.
# Station with the most rides as an ending place.
# Month by Month breakdown of number of rides with subtotals for each year.
# Most ridden bike with total number of rides for that bike.
# Least ridden bike with total number of rides for that bike.
# User subscription type breakout with both count and percentage.
# Single date with the highest number of trips with a count of those trips.
# Single date with the lowest number of trips with a count of those trips.
# On the station dashboard add the following information:

# Number of rides started at this station.
# Number of rides ended at this station.
# Most frequent destination station (for rides that began at this station).
# Most freuqnet origination station (for rides that ended at this station).
# Date with the highest number of trips started at this station.
# Most frequent zip code for users starting trips at this station.
# Bike ID most frequently starting a trip at this station.

# Date with the highest number of trips started at this station.
# Most frequent zip code for users starting trips at this station.
# Bike ID most frequently starting a trip at this station.