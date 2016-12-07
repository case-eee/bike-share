require_relative '../spec_helper'

describe "Condition" do

  describe "validates" do
    it "presence of date" do
      invalid_condition = Condition.create(max_temperature_f:4,mean_temperature_f:4, min_temperature_f:4, mean_humidity:34, mean_visibility_miles:55, max_wind_speed_mph:89)

      expect(invalid_condition).to_not be_valid
    end

    it "presence of max_temperature_f" do
      date = Date.strptime("8/30/2013", '%m/%d/%Y')
      invalid_condition = Condition.create(date:date,mean_temperature_f:4, min_temperature_f:4, mean_humidity:34, mean_visibility_miles:55, max_wind_speed_mph:89)

      expect(invalid_condition).to_not be_valid
    end

    it "presence of mean_temperature_f" do
      date = Date.strptime("8/30/2013", '%m/%d/%Y')
      invalid_condition = Condition.create(max_temperature_f:4, date:date, min_temperature_f:4, mean_humidity:34, mean_visibility_miles:55, max_wind_speed_mph:89)

      expect(invalid_condition).to_not be_valid
    end

    it "presence of min_temperature_f" do
      date = Date.strptime("8/30/2013", '%m/%d/%Y')
      invalid_condition = Condition.create(max_temperature_f:4, date:date, mean_temperature_f:4, mean_humidity:34, mean_visibility_miles:55, max_wind_speed_mph:89)

      expect(invalid_condition).to_not be_valid
    end

    it "presence of mean_humidity" do
      date = Date.strptime("8/30/2013", '%m/%d/%Y')
      invalid_condition = Condition.create(max_temperature_f:4, date:date, mean_temperature_f:4, min_temperature_f:34, mean_visibility_miles:55, max_wind_speed_mph:89)

      expect(invalid_condition).to_not be_valid
    end

    it "presence of mean_visibility_miles" do
      date = Date.strptime("8/30/2013", '%m/%d/%Y')
      invalid_condition = Condition.create(max_temperature_f:4, date:date, mean_temperature_f:4, min_temperature_f:34, mean_humidity:55, max_wind_speed_mph:89)

      expect(invalid_condition).to_not be_valid
    end

    it "presence of max_wind_speed_mph" do
      date = Date.strptime("8/30/2013", '%m/%d/%Y')
      invalid_condition = Condition.create(max_temperature_f:4, date:date, mean_temperature_f:4, min_temperature_f:34, mean_humidity:55, mean_visibility_miles:89)

      expect(invalid_condition).to_not be_valid
    end
  end

  describe ".make_range" do
    it "returns an array with temperature ranges" do
      Condition.create(date:"12-03-2012", max_temperature_f:102, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:91, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:85, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:20, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)

      expect(Condition.make_range(:max_temperature_f, 10)).to eql([[20.0, 30.0], [30.0, 40.0], [40.0, 50.0], [50.0, 60.0], [60.0, 70.0], [70.0, 80.0], [80.0, 90.0], [90.0, 100.0], [100.0, 102.0]])
    end
  end

  describe ".chunk" do
    it "returns groups of days by 10 degree - max temp - chunks" do
      Condition.create(date:"17-03-2012", max_temperature_f:102, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"13-03-2012", max_temperature_f:91, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"11-03-2012", max_temperature_f:85, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"10-03-2012", max_temperature_f:20, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"15-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)

      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "12-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "11-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subscriber", zip_code: 1029)

      expect(Condition.chunk(:max_temperature_f, 10).keys.last).to eql([100.0, 102.0])
      expect(Condition.chunk(:max_temperature_f, 10).values.last.class).to eql(Condition::ActiveRecord_Relation)
    end
  end

  describe ".average_daily" do
    it "returns average amount of rides" do
      trips_per_day = [2, 4, 6, 8]

      expect(Condition.average_daily(trips_per_day)).to eql(5.0)
    end
  end

  describe ".minimum_daily" do
    it "returns minimum amount of rides" do
      trips_per_day = [2, 4, 6, 8]

      expect(Condition.minimum_daily(trips_per_day)).to eql(2)
    end
  end

  describe ".maximum_daily" do
    it "returns maximum amount of rides" do
      trips_per_day = [2, 4, 6, 8]

      expect(Condition.maximum_daily(trips_per_day)).to eql(8)
    end
  end
  

  describe ".connect_condition_with_trips" do
    it "returns hash with ranges as keys and trips within those ranges as values" do
      Condition.create(date:"17-03-2012", max_temperature_f:102, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"13-03-2012", max_temperature_f:91, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"11-03-2012", max_temperature_f:85, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"10-03-2012", max_temperature_f:20, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"15-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)

      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "12-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "11-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "10-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "17-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      

      expect(Condition.connect_condition_with_trips(:max_temperature_f, 10).values.first).to eql([1])
    end
  end
    

  describe ".results_hash" do
    it "returns hash with range key and avg. ride, max, and min values" do
      Condition.create(date:"17-03-2012", max_temperature_f:102, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"13-03-2012", max_temperature_f:91, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"11-03-2012", max_temperature_f:85, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"10-03-2012", max_temperature_f:20, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"15-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)

      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "12-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "11-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "10-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "17-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      
      expect(Condition.ranges_with_trips(:max_temperature_f, 10).values.first).to eql([1.0, 1, 1])
    end
  end

  describe ".rides_by_temperature" do
    it "returns average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks" do
      Condition.create(date:"17-03-2012", max_temperature_f:102, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"13-03-2012", max_temperature_f:91, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"11-03-2012", max_temperature_f:85, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"10-03-2012", max_temperature_f:20, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"15-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)

      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "12-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "11-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "10-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "17-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      
      expect(Condition.rides_by_temperature.values.first).to eql([1.0, 1, 1])
    end
  end
  
  
  describe ".rides_by_precipitation" do
    it "returns average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments" do
      Condition.create(date:"17-03-2012", max_temperature_f:102, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"13-03-2012", max_temperature_f:91, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:3, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"11-03-2012", max_temperature_f:85, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:0, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"10-03-2012", max_temperature_f:20, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:1, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"15-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:1, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:0, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)

      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "12-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "11-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "10-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "17-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      
      expect(Condition.rides_by_precipitation.values.first).to eql([2.5, 4, 1])
    end
  end
  
  describe ".rides_by_mean_wind_speed" do
    it "returns average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments" do    
      Condition.create(date:"17-03-2012", max_temperature_f:102, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:27, max_gust_speed_mph:500, precipitation_inches:2, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"13-03-2012", max_temperature_f:91, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:29, max_gust_speed_mph:500, precipitation_inches:3, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"11-03-2012", max_temperature_f:85, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:20, max_gust_speed_mph:500, precipitation_inches:0, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"10-03-2012", max_temperature_f:20, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:23, max_gust_speed_mph:500, precipitation_inches:1, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"15-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:23, max_gust_speed_mph:500, precipitation_inches:1, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)
      Condition.create(date:"12-03-2012", max_temperature_f:86, mean_temperature_f:75, min_temperature_f:44, max_dew_point_f:5, mean_dew_point_f:3, min_dew_point_f:1, max_humidity:46, mean_humidity:42, min_humidity:24, max_sea_level_pressure_inches:33, mean_sea_level_pressure_inches:25, min_sea_level_pressure_inches:20, max_visibility_miles:2.4, mean_visibility_miles:2.1, min_visibility_miles:1.7, max_wind_speed_mph:40, mean_wind_speed_mph:20, max_gust_speed_mph:500, precipitation_inches:0, cloud_cover:6.0, events:"rainy", wind_dir_degrees:43, zip_code:90210)

      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "12-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "11-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 24, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date: "12-03-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 25, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "10-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date: "17-03-2012 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
      
      expect(Condition.rides_by_mean_wind_speed.values.first).to eql([2.0, 4, 1])
    end
  end

  describe ".rides_by_mean_visibility" do
    it "returns average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments" do
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

      expect(Condition.rides_by_mean_visibility.values.first).to eql([2.0, 4, 1])
    end
  end
      



end
