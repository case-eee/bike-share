require_relative '../spec_helper'

describe 'WeatherCondition' do

  describe 'validates' do

    it 'presence of date' do
      invalid_wc = WeatherCondition.create( date: "",
                                            max_temperature_f: "70",
                                            mean_temperature_f: "50",
                                            min_temperature_f: "40",
                                            mean_humidity: "60",
                                            mean_visibility_miles: "5",
                                            mean_wind_speed_mph: "5",
                                            precipitation_inches: "0.23",
                                            zip_code: "94107")

      expect(invalid_wc).to be_invalid
    end

    it 'uniqueness of date' do
      WeatherCondition.create(  date: "2016/12/7",
                                max_temperature_f: "70",
                                mean_temperature_f: "50",
                                min_temperature_f: "40",
                                mean_humidity: "60",
                                mean_visibility_miles: "5",
                                mean_wind_speed_mph: "5",
                                precipitation_inches: "0.23",
                                zip_code: "94107")
      invalid_wc = WeatherCondition.create( date: "2016/12/7",
                                            max_temperature_f: "71",
                                            mean_temperature_f: "51",
                                            min_temperature_f: "41",
                                            mean_humidity: "61",
                                            mean_visibility_miles: "6",
                                            mean_wind_speed_mph: "6",
                                            precipitation_inches: "0.24",
                                            zip_code: "94107")

      expect(invalid_wc).to be_invalid
    end

    it 'presence of max_temperature_f' do
      invalid_wc = WeatherCondition.create( date: "2016/12/6",
                                            max_temperature_f: "",
                                            mean_temperature_f: "50",
                                            min_temperature_f: "40",
                                            mean_humidity: "60",
                                            mean_visibility_miles: "5",
                                            mean_wind_speed_mph: "5",
                                            precipitation_inches: "0.23",
                                            zip_code: "94107")

      expect(invalid_wc).to be_invalid
    end

    it 'presence of mean_temperature_f' do
      invalid_wc = WeatherCondition.create( date: "2016/12/6",
                                            max_temperature_f: "70",
                                            mean_temperature_f: "",
                                            min_temperature_f: "40",
                                            mean_humidity: "60",
                                            mean_visibility_miles: "5",
                                            mean_wind_speed_mph: "5",
                                            precipitation_inches: "0.23",
                                            zip_code: "94107")

      expect(invalid_wc).to be_invalid
    end

    it 'presence of min_temperature_f' do
      invalid_wc = WeatherCondition.create( date: "2016/12/6",
                                            max_temperature_f: "70",
                                            mean_temperature_f: "50",
                                            min_temperature_f: "",
                                            mean_humidity: "60",
                                            mean_visibility_miles: "5",
                                            mean_wind_speed_mph: "5",
                                            precipitation_inches: "0.23",
                                            zip_code: "94107")

      expect(invalid_wc).to be_invalid
    end

    it 'presence of mean_humidity' do
      invalid_wc = WeatherCondition.create( date: "2016/12/6",
                                            max_temperature_f: "70",
                                            mean_temperature_f: "50",
                                            min_temperature_f: "40",
                                            mean_humidity: "",
                                            mean_visibility_miles: "5",
                                            mean_wind_speed_mph: "5",
                                            precipitation_inches: "0.23",
                                            zip_code: "94107")

      expect(invalid_wc).to be_invalid
    end

    it 'presence of mean_visibility_miles' do
      invalid_wc = WeatherCondition.create( date: "2016/12/6",
                                            max_temperature_f: "70",
                                            mean_temperature_f: "50",
                                            min_temperature_f: "40",
                                            mean_humidity: "60",
                                            mean_visibility_miles: "",
                                            mean_wind_speed_mph: "5",
                                            precipitation_inches: "0.23",
                                            zip_code: "94107")

      expect(invalid_wc).to be_invalid
    end

    it 'presence of mean_wind_speed_mph' do
      invalid_wc = WeatherCondition.create( date: "2016/12/6",
                                            max_temperature_f: "70",
                                            mean_temperature_f: "50",
                                            min_temperature_f: "40",
                                            mean_humidity: "60",
                                            mean_visibility_miles: "5",
                                            mean_wind_speed_mph: "",
                                            precipitation_inches: "0.23",
                                            zip_code: "94107")

      expect(invalid_wc).to be_invalid
    end

    it 'presence of precipitation_inches' do
      invalid_wc = WeatherCondition.create( date: "2016/12/6",
                                            max_temperature_f: "70",
                                            mean_temperature_f: "50",
                                            min_temperature_f: "40",
                                            mean_humidity: "60",
                                            mean_visibility_miles: "5",
                                            mean_wind_speed_mph: "5",
                                            precipitation_inches: "",
                                            zip_code: "94107")

      expect(invalid_wc).to be_invalid
    end

    it 'presence of zip_code' do
      invalid_wc = WeatherCondition.create( date: "2016/12/6",
                                            max_temperature_f: "70",
                                            mean_temperature_f: "50",
                                            min_temperature_f: "40",
                                            mean_humidity: "60",
                                            mean_visibility_miles: "5",
                                            mean_wind_speed_mph: "5",
                                            precipitation_inches: "0.23",
                                            zip_code: "")

      expect(invalid_wc).to be_invalid
    end

    it 'zip_code is 94107' do
      invalid_wc = WeatherCondition.create( date: "2016/12/6",
                                            max_temperature_f: "70",
                                            mean_temperature_f: "50",
                                            min_temperature_f: "40",
                                            mean_humidity: "60",
                                            mean_visibility_miles: "5",
                                            mean_wind_speed_mph: "5",
                                            precipitation_inches: "0.23",
                                            zip_code: "90210")

      expect(invalid_wc).to be_invalid
    end
  end
end

describe 'Weather Conditions Methods' do

  before do
    %w(Denver Aurora Centennial).each {|city| City.create(name: city) }
    %w(Subscriber Customer).each {|type| SubscriptionType.create(subscription_type: type) }
    denver, aurora, centennial = City.find(1), City.find(2), City.find(3)
    denver.stations.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, installation_date: "2013-08-06 00:00:00", lat: 37.329732, long: -121.901782)
    denver.stations.create(name: "San Jose Civic Center", dock_count: 15, installation_date: "2013-08-05 00:00:00", lat: 37.330698, long: -121.888979)
    aurora.stations.create(name: "Jan Sose Diridon Caltrain Station", dock_count: 27, installation_date: "2013-08-06 00:00:00", lat: 37.329732, long: -121.901782)
    aurora.stations.create(name: "Jan Sose Civic Center", dock_count: 15, installation_date: "2013-08-05 00:00:00", lat: 37.330698, long: -121.888979)
    centennial.stations.create(name: "Naj Esos Diridon Caltrain Station", dock_count: 27, installation_date: "2013-08-06 00:00:00", lat: 37.329732, long: -121.901782)
    centennial.stations.create(name: "Naj Esos Civic Center", dock_count: 15, installation_date: "2013-08-05 00:00:00", lat: 37.330698, long: -121.888979)
    Trip.create(duration: 100, start_date: "2013-08-29", start_station_id: 1, end_date: "2013-08-29", end_station_id: 2, bike_id: 520, subscription_type_id: 1, user_zip_code: 94127, start_time: "2000-01-01 14:13:00", end_time: "2000-01-01 14:14:00")
    Trip.create(duration: 100, start_date: "2013-08-29", start_station_id: 2, end_date: "2013-08-29", end_station_id: 4, bike_id: 520, subscription_type_id: 2, user_zip_code: 94127, start_time: "2000-01-01 14:13:00", end_time: "2000-01-01 14:14:00")
    Trip.create(duration: 100, start_date: "2013-07-30", start_station_id: 5, end_date: "2013-07-30", end_station_id: 1, bike_id: 520, subscription_type_id: 2, user_zip_code: 94127, start_time: "2000-01-01 14:13:00", end_time: "2000-01-01 14:14:00")
    Trip.create(duration: 100, start_date: "2014-08-09", start_station_id: 4, end_date: "2014-08-10", end_station_id: 3, bike_id: 520, subscription_type_id: 1, user_zip_code: 94127, start_time: "2000-01-01 14:13:00", end_time: "2000-01-01 14:14:00")
    Trip.create(duration: 100, start_date: "2013-01-02", start_station_id: 3, end_date: "2013-01-10", end_station_id: 5, bike_id: 520, subscription_type_id: 1, user_zip_code: 94127, start_time: "2000-01-01 14:13:00", end_time: "2000-01-01 14:14:00")
    Trip.create(duration: 100, start_date: "1992-02-11", start_station_id: 6, end_date: "1992-02-11", end_station_id: 6, bike_id: 520, subscription_type_id: 1, user_zip_code: 94127, start_time: "2000-01-01 14:13:00", end_time: "2000-01-01 14:14:00")
    WeatherCondition.create(date: "2013-08-29", max_temperature_f: 84, mean_temperature_f: 68, min_temperature_f: 61, mean_humidity: 75, mean_visibility_miles: 2, mean_wind_speed_mph: 0, precipitation_inches: 0.0, zip_code: 94107)
    WeatherCondition.create(date: "2013-07-30", max_temperature_f: 84, mean_temperature_f: 68, min_temperature_f: 61, mean_humidity: 75, mean_visibility_miles: 15, mean_wind_speed_mph: 3, precipitation_inches: 0.4, zip_code: 94107)
    WeatherCondition.create(date: "2014-08-09", max_temperature_f: 73, mean_temperature_f: 68, min_temperature_f: 61, mean_humidity: 75, mean_visibility_miles: 6, mean_wind_speed_mph: 8, precipitation_inches: 0.82, zip_code: 94107)
    WeatherCondition.create(date: "2013-01-02", max_temperature_f: 73, mean_temperature_f: 68, min_temperature_f: 61, mean_humidity: 75, mean_visibility_miles: 7, mean_wind_speed_mph: 8, precipitation_inches: 1.1, zip_code: 94107)
    WeatherCondition.create(date: "1992-02-11", max_temperature_f: 52, mean_temperature_f: 68, min_temperature_f: 61, mean_humidity: 75, mean_visibility_miles: 7, mean_wind_speed_mph: 12, precipitation_inches: 2.3, zip_code: 94107)
    WeatherCondition.create(date: "1991-01-02", max_temperature_f: 52, mean_temperature_f: 68, min_temperature_f: 61, mean_humidity: 75, mean_visibility_miles: 7, mean_wind_speed_mph: 12, precipitation_inches: 2.3, zip_code: 94107)
  end

  describe "trip associations" do
    it ":trips returns expected trips for a condition" do
      condition = WeatherCondition.first
      condition_trips = Trip.where(start_date: condition.date)
      expect(condition.trips).to eq(condition_trips)
      expect(condition.trips.all.all?{|trip| trip.class.to_s == "Trip"}).to be true
    end

    it "and :trips returns expected trips for a different condition" do
      condition = WeatherCondition.all[1]
      condition_trips = Trip.where(start_date: condition.date)
      expect(condition.trips).to eq(condition_trips)
      expect(condition.trips.all.all?{|trip| trip.class.to_s == "Trip"}).to be true
    end

    it "and one more different condition" do
      condition = WeatherCondition.all[3]
      condition_trips = Trip.where(start_date: condition.date)
      expect(condition.trips).to eq(condition_trips)
      expect(condition.trips.all.all?{|trip| trip.class.to_s == "Trip"}).to be true
    end

  end

  describe "analytics for weather conditions and trips" do
    it ".trips_on_days returns a hash of dates pointing to trip count'" do
      trips = Trip.all.all.reduce({}) do |result, trip|
        result[trip.start_date] = 0 unless result[trip.start_date]
        result[trip.start_date] += 1
        result
      end
      days_trips = WeatherCondition.trips_on_days(WeatherCondition.all)
      expect(days_trips).to eq(trips)
      expect(days_trips.keys.all?{|key| key.class == Date}).to be true
    end

    it ".trips_on_days works on a specified conditions range'" do
      conditions = WeatherCondition.where(max_temperature_f: [70..79])
      trips = Trip.all.find_all {|trip| trip.weather_condition.max_temperature_f.between?(70, 79)}
      trips = trips.reduce({}) do |result, trip|
        result[trip.start_date] = 0 unless result[trip.start_date]
        result[trip.start_date] += 1
        result
      end
      expect(WeatherCondition.trips_on_days(conditions)).to eq(trips)
      expect(trips.keys.all?{|key| key.class == Date}).to be true
    end

    it ".days_with_high_temp returns trips with max_temp in range of number plus nine " do
      days = WeatherCondition.days_with_high_temp(80)
      days2 = WeatherCondition.all.find_all {|day| day.max_temperature_f.between?(80, 89)}
      expect(days).to eq(days2)
      expect(days.class).to eq(WeatherCondition::ActiveRecord_Relation)
    end

    it ".days_with_precip_inches returns trips with precip inches in range of number plus 0.49 " do
      days = WeatherCondition.days_with_precip_inches(1)
      days2 = WeatherCondition.all.find_all {|day| day.precipitation_inches.between?(1, 1.49)}
      expect(days).to eq(days2)
      expect(days.class).to eq(WeatherCondition::ActiveRecord_Relation)
    end

    it ".days_with_wind_speed returns trips with mean wind speed in range of number plus 3 " do
      days = WeatherCondition.days_with_wind_speed(4)
      days2 = WeatherCondition.all.find_all {|day| day.mean_wind_speed_mph.between?(4, 7)}
      expect(days).to eq(days2)
      expect(days.class).to eq(WeatherCondition::ActiveRecord_Relation)
    end

    it ".days_with_visibility returns trips with mean visibility in range of number plus 3 " do
      days = WeatherCondition.days_with_visibility(4)
      days2 = WeatherCondition.all.find_all {|day| day.mean_visibility_miles.between?(4, 7)}
      expect(days).to eq(days2)
      expect(days.class).to eq(WeatherCondition::ActiveRecord_Relation)
    end

    it ".temperature_metrics returns a hash of floor range values pointing to ride metrics" do
      temp_metrics = WeatherCondition.temperature_metrics
      values = temp_metrics.values.all? do |val|
        val.has_key?(:average_rides) &&
        val.has_key?(:highest_rides) &&
        val.has_key?(:lowest_rides)
      end
      expect(temp_metrics).to be_instance_of(Hash)
      expect(temp_metrics.keys).to eq(%w(50 60 70 80))
      expect(values).to be true
    end

    it ".precipitation_metrics returns a hash of floor range values pointing to ride metrics" do
      precip_metrics = WeatherCondition.precipitation_metrics
      values = precip_metrics.values.all? do |val|
        val.has_key?(:average_rides) &&
        val.has_key?(:highest_rides) &&
        val.has_key?(:lowest_rides)
      end
      expect(precip_metrics).to be_instance_of(Hash)
      expect(precip_metrics.keys).to eq(%w(0.0 0.5 1.0 1.5 2.0))
      expect(values).to be true
    end

    it ".wind_metrics returns a hash of floor range values pointing to ride metrics" do
      wind_metrics = WeatherCondition.wind_metrics
      values = wind_metrics.values.all? do |val|
        val.has_key?(:average_rides) &&
        val.has_key?(:highest_rides) &&
        val.has_key?(:lowest_rides)
      end
      expect(wind_metrics).to be_instance_of(Hash)
      expect(wind_metrics.keys).to eq(%w(0 4 8 12))
      expect(values).to be true
    end

    it ".visibility_metrics returns a hash of floor range values pointing to ride metrics" do
      visibility_metrics = WeatherCondition.visibility_metrics
      values = visibility_metrics.values.all? do |val|
        val.has_key?(:average_rides) &&
        val.has_key?(:highest_rides) &&
        val.has_key?(:lowest_rides)
      end
      expect(visibility_metrics).to be_instance_of(Hash)
      expect(visibility_metrics.keys).to eq(%w(0 4 8 12))
      expect(values).to be true
    end

    it ".master_metrics returns category keys pointint to metric hashes" do
      master_metrics = WeatherCondition.master_metrics
      values = master_metrics.values.all? {|val| val.class == Hash }
      expect(master_metrics).to be_instance_of(Hash)
      expect(master_metrics.keys).to eq([:temperature, :precipitation, :wind, :visibility])
      expect(values).to be true
    end

    it ".average_rides returns average of rides from day range" do
      rides = WeatherCondition.trips_on_days(WeatherCondition.all).values
      average = WeatherCondition.average_rides(rides)
      expect(average).to be_instance_of(Fixnum)
      expect(average).to eq(1)
    end

    it ".highest_rides returns ride count from day with highest rides" do
      rides = WeatherCondition.trips_on_days(WeatherCondition.all).values
      highest = WeatherCondition.highest_rides(rides)
      expect(highest).to be_instance_of(Fixnum)
      expect(highest).to eq(2)
    end

    it ".lowest_rides returns ride count from day with lowest rides" do
      require 'pry'; binding.pry
      rides = WeatherCondition.trips_on_days(WeatherCondition.all).values
      lowest = WeatherCondition.lowest_rides(rides)
      expect(lowest).to be_instance_of(Fixnum)
      expect(lowest).to eq(1)
    end

    it ".ride_metrics returns a hash of average, lowest, and highest keys pointing to values" do
      rides = WeatherCondition.trips_on_days(WeatherCondition.all).values
      metrics = WeatherCondition.ride_metrics(rides)
      values = metrics.values.all? {|val| val.class == Float || val.class == Fixnum }
      expect(values).to be true
      expect(metrics.keys).to eq([:average_rides, :lowest_rides, :highest_rides])
    end

    it ".metric_range_with_increments_of returns an array of temp values with range of condition min and max" do
      temp = WeatherCondition.metric_range_with_increments_of(:max_temperature_f, 10)
      expect(temp).to be_instance_of Array
      expect(temp).to eq([50,60,70,80])
    end

    it ".weather_on_day_with_highest_rides returns array of weather and ride count" do
      highest = WeatherCondition.weather_on_day_with_highest_rides
      expect(highest).to be_instance_of Array
      expect(highest.first.class.to_s).to eq("WeatherCondition")
      expect(highest.last).to be_instance_of Fixnum
    end

    it ".weather_on_day_with_lowest_rides returns array of weather and ride count" do
      lowest = WeatherCondition.weather_on_day_with_lowest_rides
      expect(lowest).to be_instance_of Array
      expect(lowest.first.class.to_s).to eq("WeatherCondition")
      expect(lowest.last).to be_instance_of Fixnum
    end
  end
end
