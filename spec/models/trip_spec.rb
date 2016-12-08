require_relative '../spec_helper'

describe "Trip" do
  describe "Validates" do
    it "presence of duration" do
      invalid_trip = Trip.create( start_station_id: 14242,
                                  end_station_id: 13233,
                                  start_date: "11-3-2014 14:44",
                                  end_date: "11-3-2014 14:55",
                                  bike_id: 23,
                                  subscription_type: "Subscriber",
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of start_station_id" do
      invalid_trip = Trip.create( duration: 14242,
                                  end_station_id: 13233,
                                  start_date: "11-3-2014 14:44",
                                  end_date: "11-3-2014 14:55",
                                  bike_id: 23,
                                  subscription_type: "Subscriber",
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of end_station_id" do
      invalid_trip = Trip.create( start_station_id: 14242,
                                  duration: 13233,
                                  start_date: "11-3-2014 14:44",
                                  end_date: "11-3-2014 14:55",
                                  bike_id: 23,
                                  subscription_type: "Subscriber",
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of start_date" do
      invalid_trip = Trip.create( start_station_id: 14242,
                                  end_station_id: 13233,
                                  duration: 4,
                                  end_date: "11-3-2014 14:55",
                                  bike_id: 23,
                                  subscription_type: "Subscriber",
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of end_date" do
      invalid_trip = Trip.create( start_station_id: 14242,
                                  end_station_id: 13233,
                                  start_date: "11-3-2014 14:44",
                                  duration: 44,
                                  bike_id: 23,
                                  subscription_type: "Subscriber",
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of bike_id" do
      invalid_trip = Trip.create( start_station_id: 14242,
                                  end_station_id: 13233,
                                  start_date: "11-3-2014 14:44",
                                  end_date: "11-3-2014 14:55",
                                  duration: 23,
                                  subscription_type: "Subscriber",
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
                                  subscription_type: "Subscriber",
                                  duration: 1029)

      expect(invalid_trip).to_not be_valid
    end
  end


  describe ".average_trip_duration" do
    it "returns the average trip duration" do
      Trip.create(duration: 20, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)


      expect(Trip.average_trip_duration).to eql(30)
    end
  end

  describe ".longest_ride" do
    it "returns the longest ride out of all trips" do
      Trip.create(duration: 20, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)

      expect(Trip.longest_ride).to eql(40)
    end
  end

  describe ".shortest_ride" do
    it "returns the shortest ride out of all trips" do
      Trip.create(duration: 20, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)

      expect(Trip.shortest_ride).to eql(20)
    end
  end

  describe ".most_starting_rides_station" do
    it "returns the station with the most starting rides" do
      Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Station.create(name:"paul",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Station.create(name:"paul",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 13233, start_date: "11-3-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)

      expect(Trip.most_starting_rides_station.id).to eql(1)
    end
  end

  describe ".most_ending_rides_station" do
    it "returns the station with the most ending rides" do
      Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Station.create(name:"paul",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Station.create(name:"paul",dock_count:30,city_id:3,installation_date:'1999-10-24')
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-3-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)

      expect(Trip.most_ending_rides_station.id).to eql(1)
    end
  end


  describe ".number_of_rides_by_month" do
    it "returns month by month breakdown of number of rides with subtotals of each year" do
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-1-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-1-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "6-6-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-12-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)


      expect(Trip.number_of_rides_by_month(2014).first).to eql(4)
      expect(Trip.number_of_rides_by_month(2014).last[1.0]).to eql(2)
      expect(Trip.number_of_rides_by_month(2014).last[12.0]).to eql(1)

    end
  end

  describe ".year_iterator" do
    it "returns month by month breakdown of number of rides with subtotals of each year" do
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-1-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-1-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "6-6-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-12-2014 14:44", end_date: "11-3-2013 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2013 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)


      expect(Trip.year_iterator.last[0]).to eql(2014)
    end
  end

  describe ".most_ridden_bike" do
    it "returns the most ridden bike with the total number of rides for that bike" do
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "6-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subscriber", zip_code: 1029)

      expect(Trip.most_ridden_bike.count).to eql(2)
      expect(Trip.most_ridden_bike.first.last).to eql(2)

    end
  end

  describe ".least_ridden_bike" do
    it "returns the least ridden bike with the total number of rides for that bike" do
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "6-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 21, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 22, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subscriber", zip_code: 1029)

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

  describe '.most_trips' do
    it "returns a single date with the highest number of trips with a count of those trips" do
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "6-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 21, subscription_type: "Baller", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 22, subscription_type: "Baller", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Baller", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "OG", zip_code: 1029)

      expect(Trip.most_trips.to_s).to eql("[Sat, 01 Mar 2014, 2]")
    end
  end

  describe '.least_trips' do
    it "returns a single date with the lowest number of trips with a count of those trips" do
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "6-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 21, subscription_type: "Baller", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 22, subscription_type: "Baller", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Baller", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "OG", zip_code: 1029)

      expect(Trip.least_trips.to_s).to eql("[Thu, 06 Mar 2014, 1]")
    end
  end

  describe '.condition_on_day_with_most_rides' do
    it "returns the weather on the day with the highest rides" do
      Condition.create(date:"17-03-2012", max_temperature_f:102, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:27, min_visibility_miles:27, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"13-03-2012", max_temperature_f:91, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:29, min_visibility_miles:29, max_wind_speed_mph:40, mean_wind_speed_mph:29, max_gust_speed_mph:500, precipitation_inches:3, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"11-03-2012", max_temperature_f:85, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:20, min_visibility_miles:20, max_wind_speed_mph:40, mean_wind_speed_mph:20, max_gust_speed_mph:500, precipitation_inches:0, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"10-03-2012", max_temperature_f:20, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:23, min_visibility_miles:23, max_wind_speed_mph:40, mean_wind_speed_mph:23, max_gust_speed_mph:500, precipitation_inches:1, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"15-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:23, min_visibility_miles:23, max_wind_speed_mph:40, mean_wind_speed_mph:23, max_gust_speed_mph:500, precipitation_inches:1, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:20, min_visibility_miles:20, max_wind_speed_mph:40, mean_wind_speed_mph:20, max_gust_speed_mph:500, precipitation_inches:0, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)

      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "12-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "11-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "10-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "17-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)

      expect(Trip.condition_on_day_with_most_rides.first.id.to_s).to eql("2012-03-12")
    end
  end

    describe '.condition_on_day_with_least_rides' do
      it "returns the weather on the day with the lowest rides" do
      Condition.create(date:"17-03-2012", max_temperature_f:102, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:27, min_visibility_miles:27, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"13-03-2012", max_temperature_f:91, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:29, min_visibility_miles:29, max_wind_speed_mph:40, mean_wind_speed_mph:29, max_gust_speed_mph:500, precipitation_inches:3, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"11-03-2012", max_temperature_f:85, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:20, min_visibility_miles:20, max_wind_speed_mph:40, mean_wind_speed_mph:20, max_gust_speed_mph:500, precipitation_inches:0, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"10-03-2012", max_temperature_f:20, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:23, min_visibility_miles:23, max_wind_speed_mph:40, mean_wind_speed_mph:23, max_gust_speed_mph:500, precipitation_inches:1, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"15-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:23, min_visibility_miles:23, max_wind_speed_mph:40, mean_wind_speed_mph:23, max_gust_speed_mph:500, precipitation_inches:1, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:20, min_visibility_miles:20, max_wind_speed_mph:40, mean_wind_speed_mph:20, max_gust_speed_mph:500, precipitation_inches:0, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)

      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "12-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "11-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "10-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "17-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)

      expect(Trip.condition_on_day_with_least_rides.first.id.to_s).to eql("2012-03-10")      
      end
    end



end