require_relative '../spec_helper'

describe "Conditon" do
  describe 'it can find condition instances by weather' do
    it "finds conditions that ocurr in max temperature 10 degree ranges" do
      Condition.create(date: '2000-01-01', precipitation_inches: 5,
                       max_temperature_f: 52, min_temperature_f: 20,
                       mean_temperature_f: 35, mean_visibility_miles: 10,
                       mean_wind_speed_mph: 20, mean_humidity: 20,
                       zip_code: 94107)
      Condition.create(date: '2000-02-02', precipitation_inches: 5,
                       max_temperature_f: 59, min_temperature_f: 20,
                       mean_temperature_f: 3, mean_visibility_miles: 10,
                       mean_wind_speed_mph: 20, mean_humidity: 20,
                       zip_code: 94107)
      Condition.create(date: '2000-03-03', precipitation_inches: 5,
                       max_temperature_f: 40, min_temperature_f: 20,
                       mean_temperature_f: 35, mean_visibility_miles: 10,
                       mean_wind_speed_mph: 20, mean_humidity: 20,
                       zip_code: 94107)

      expect((Condition.max_temperature_range(50)).ids).to eq([1,2])
      expect((Condition.max_temperature_range(40).ids)).to eq([3])
    end

    it "find conditions that ocurr in half inch precipitation range" do
      Condition.create(date: '2000-01-01', precipitation_inches: 0.0,
                       max_temperature_f: 52, min_temperature_f: 20,
                       mean_temperature_f: 35, mean_visibility_miles: 10,
                       mean_wind_speed_mph: 20, mean_humidity: 20,
                       zip_code: 94107)
      Condition.create(date: '2000-02-02', precipitation_inches: 0.4,
                       max_temperature_f: 59, min_temperature_f: 20,
                       mean_temperature_f: 3, mean_visibility_miles: 10,
                       mean_wind_speed_mph: 20, mean_humidity: 20,
                       zip_code: 94107)
      Condition.create(date: '2000-03-03', precipitation_inches: 0.5,
                       max_temperature_f: 40, min_temperature_f: 20,
                       mean_temperature_f: 35, mean_visibility_miles: 10,
                       mean_wind_speed_mph: 20, mean_humidity: 20,
                       zip_code: 94107)
      Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                       max_temperature_f: 40, min_temperature_f: 20,
                       mean_temperature_f: 35, mean_visibility_miles: 10,
                       mean_wind_speed_mph: 20, mean_humidity: 20,
                       zip_code: 94107)

      expect(Condition.precipitation_in_half_inch_increments(0.0).ids).to eq([1,2])
      expect(Condition.precipitation_in_half_inch_increments(0.5).ids).to eq([3,4])
    end

    it 'finds conditions that occur within mean wind speed chunks of 4' do

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 6, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 3, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 2, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 7, mean_humidity: 20,
                     zip_code: 94107)

    expect(Condition.wind_speed_in_4_mph_chunks(0).ids).to eq([2,3])
    expect(Condition.wind_speed_in_4_mph_chunks(4).ids).to eq([1,4])
    end

    it 'finds conditions ids that have mean wind speed in 4 mile chunks' do
    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 3,
                     mean_wind_speed_mph: 7, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 6,
                     mean_wind_speed_mph: 7, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 2,
                     mean_wind_speed_mph: 7, mean_humidity: 20,
                     zip_code: 94107)

    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 5,
                     mean_wind_speed_mph: 7, mean_humidity: 20,
                     zip_code: 94107)

    expect(Condition.visibility_in_4_mile_range(0).ids).to eq([1,3])
    expect(Condition.visibility_in_4_mile_range(4).ids).to eq([2,4])
    end

  end

  describe 'it finds trips that occured on days by conditions' do
    describe 'it finds trips based on temperature range' do
      it 'finds minimum number of trips that occur in temperature range' do
            Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                             max_temperature_f: 40, min_temperature_f: 20,
                             mean_temperature_f: 35, mean_visibility_miles: 3,
                             mean_wind_speed_mph: 7, mean_humidity: 20,
                             zip_code: 94107)

            Condition.create(date: '2000-03-04', precipitation_inches: 0.8,
                             max_temperature_f: 44, min_temperature_f: 20,
                             mean_temperature_f: 35, mean_visibility_miles: 6,
                             mean_wind_speed_mph: 7, mean_humidity: 20,
                             zip_code: 94107)

            Condition.create(date: '2000-03-05', precipitation_inches: 0.8,
                             max_temperature_f: 49, min_temperature_f: 20,
                             mean_temperature_f: 35, mean_visibility_miles: 2,
                             mean_wind_speed_mph: 7, mean_humidity: 20,
                             zip_code: 94107)

            Condition.create(date: '2000-03-06', precipitation_inches: 0.8,
                             max_temperature_f: 50, min_temperature_f: 20,
                             mean_temperature_f: 35, mean_visibility_miles: 5,
                             mean_wind_speed_mph: 7, mean_humidity: 20,
                             zip_code: 94107)


            Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
            Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
            Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
            Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
            Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
            Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
            Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
            Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

            expect(Condition.trips_in_temperature_range(40).min).to eq(2)
            expect(Condition.trips_in_temperature_range(50).min).to eq(1)
      end

      it 'finds maximum number of trips that occur in temperature range' do
        Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                         max_temperature_f: 40, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 3,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-04', precipitation_inches: 0.8,
                         max_temperature_f: 44, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 6,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-05', precipitation_inches: 0.8,
                         max_temperature_f: 49, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 2,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-06', precipitation_inches: 0.8,
                         max_temperature_f: 50, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 5,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)


        Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

        expect(Condition.trips_in_temperature_range(40).max).to eq(3)
        expect(Condition.trips_in_temperature_range(50).max).to eq(1)
      end

      it 'finds average number of trips that occur in temperature range' do
        Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                         max_temperature_f: 40, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 3,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-04', precipitation_inches: 0.8,
                         max_temperature_f: 44, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 6,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-05', precipitation_inches: 0.8,
                         max_temperature_f: 49, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 2,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-06', precipitation_inches: 0.8,
                         max_temperature_f: 50, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 5,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)


        Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

        expect(Condition.trips_in_temperature_range(40).average).to eq(2)
        expect(Condition.trips_in_temperature_range(50).average).to eq(1)
      end
    end

    describe 'it finds trips based on precipitation range' do
      it 'finds the minimum trips that occur for precipitation range' do
        Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                         max_temperature_f: 40, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 3,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-04', precipitation_inches: 0.9,
                         max_temperature_f: 44, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 6,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-05', precipitation_inches: 0.1,
                         max_temperature_f: 49, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 2,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-06', precipitation_inches: 0.34,
                         max_temperature_f: 50, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 5,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)


        Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

        expect(Condition.trips_in_precipitation_range(0.0).min).to eq(1)
        expect(Condition.trips_in_precipitation_range(0.5).min).to eq(2)
      end

      it 'finds the maximum trips that occur for precipitation range' do
        Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                         max_temperature_f: 40, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 3,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-04', precipitation_inches: 0.9,
                         max_temperature_f: 44, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 6,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-05', precipitation_inches: 0.1,
                         max_temperature_f: 49, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 2,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-06', precipitation_inches: 0.34,
                         max_temperature_f: 50, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 5,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)


        Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

        expect(Condition.trips_in_precipitation_range(0.0).max).to eq(2)
        expect(Condition.trips_in_precipitation_range(0.5).max).to eq(3)
      end

      it 'finds the average trips that occur for precipitation range' do
        Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                         max_temperature_f: 40, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 3,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-04', precipitation_inches: 0.9,
                         max_temperature_f: 44, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 6,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-05', precipitation_inches: 0.2,
                         max_temperature_f: 49, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 2,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-06', precipitation_inches: 0.34,
                         max_temperature_f: 50, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 5,
                         mean_wind_speed_mph: 7, mean_humidity: 20,
                         zip_code: 94107)


        Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

        expect(Condition.trips_in_precipitation_range(0.0).average).to eq(1)
        expect(Condition.trips_in_precipitation_range(0.5).average).to eq(2)
      end
    end
    describe 'it finds trips based on wind speed range' do
      it 'finds the minimum trips that occur for wind speed range' do
        Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                         max_temperature_f: 40, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 3,
                         mean_wind_speed_mph: 2, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-04', precipitation_inches: 0.9,
                         max_temperature_f: 44, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 6,
                         mean_wind_speed_mph: 3, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-05', precipitation_inches: 0.1,
                         max_temperature_f: 49, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 2,
                         mean_wind_speed_mph: 5, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-06', precipitation_inches: 0.34,
                         max_temperature_f: 50, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 5,
                         mean_wind_speed_mph: 6, mean_humidity: 20,
                         zip_code: 94107)


        Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

        expect(Condition.trips_in_precipitation_range(0.0).min).to eq(1)
        expect(Condition.trips_in_precipitation_range(0.5).min).to eq(2)
      end

      it 'finds the maximum trips that occur for wind speed range' do
        Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                         max_temperature_f: 40, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 3,
                         mean_wind_speed_mph: 2, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-04', precipitation_inches: 0.9,
                         max_temperature_f: 44, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 6,
                         mean_wind_speed_mph: 3, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-05', precipitation_inches: 0.1,
                         max_temperature_f: 49, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 2,
                         mean_wind_speed_mph: 5, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-06', precipitation_inches: 0.34,
                         max_temperature_f: 50, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 5,
                         mean_wind_speed_mph: 6, mean_humidity: 20,
                         zip_code: 94107)


        Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

        expect(Condition.trips_in_precipitation_range(0.0).max).to eq(2)
        expect(Condition.trips_in_precipitation_range(0.5).max).to eq(3)
      end

      it 'finds the average trips that occur for wind speed range' do
        Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                         max_temperature_f: 40, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 3,
                         mean_wind_speed_mph: 2, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-04', precipitation_inches: 0.9,
                         max_temperature_f: 44, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 6,
                         mean_wind_speed_mph: 3, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-05', precipitation_inches: 0.2,
                         max_temperature_f: 49, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 2,
                         mean_wind_speed_mph: 5, mean_humidity: 20,
                         zip_code: 94107)

        Condition.create(date: '2000-03-06', precipitation_inches: 0.34,
                         max_temperature_f: 50, min_temperature_f: 20,
                         mean_temperature_f: 35, mean_visibility_miles: 5,
                         mean_wind_speed_mph: 6, mean_humidity: 20,
                         zip_code: 94107)


        Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
        Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

        expect(Condition.trips_in_precipitation_range(0.0).average).to eq(1)
        expect(Condition.trips_in_precipitation_range(0.5).average).to eq(2)
      end
    end
      describe 'it finds trips based on wind speed range' do
        it 'finds the minimum trips that occur for wind speed range' do
          Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                           max_temperature_f: 40, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 3,
                           mean_wind_speed_mph: 2, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-04', precipitation_inches: 0.9,
                           max_temperature_f: 44, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 6,
                           mean_wind_speed_mph: 3, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-05', precipitation_inches: 0.1,
                           max_temperature_f: 49, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 2,
                           mean_wind_speed_mph: 5, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-06', precipitation_inches: 0.34,
                           max_temperature_f: 50, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 5,
                           mean_wind_speed_mph: 6, mean_humidity: 20,
                           zip_code: 94107)


          Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

          expect(Condition.trips_with_visibility_in_4_mile_range(0).min).to eq(2)
          expect(Condition.trips_with_visibility_in_4_mile_range(4).min).to eq(1)
        end

        it 'finds the maximum trips that occur for wind speed range' do

          Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                           max_temperature_f: 40, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 3,
                           mean_wind_speed_mph: 2, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-04', precipitation_inches: 0.9,
                           max_temperature_f: 44, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 6,
                           mean_wind_speed_mph: 3, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-05', precipitation_inches: 0.1,
                           max_temperature_f: 49, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 2,
                           mean_wind_speed_mph: 5, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-06', precipitation_inches: 0.34,
                           max_temperature_f: 50, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 5,
                           mean_wind_speed_mph: 6, mean_humidity: 20,
                           zip_code: 94107)


          Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

          expect(Condition.trips_with_visibility_in_4_mile_range(0).max).to eq(3)
          expect(Condition.trips_with_visibility_in_4_mile_range(4).max).to eq(2)
        end

        it 'finds the average trips that occur for wind speed range' do
          Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                           max_temperature_f: 40, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 3,
                           mean_wind_speed_mph: 2, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-04', precipitation_inches: 0.9,
                           max_temperature_f: 44, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 6,
                           mean_wind_speed_mph: 3, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-05', precipitation_inches: 0.2,
                           max_temperature_f: 49, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 2,
                           mean_wind_speed_mph: 5, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-06', precipitation_inches: 0.34,
                           max_temperature_f: 50, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 5,
                           mean_wind_speed_mph: 6, mean_humidity: 20,
                           zip_code: 94107)


          Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

          expect(Condition.trips_with_visibility_in_4_mile_range(0).average).to eq(2)
          expect(Condition.trips_with_visibility_in_4_mile_range(4).average).to eq(1)
        end
      end

      describe "it finds weather for highest and lowest ride count days" do
        it 'finds weather conditions for the highest ride day' do
          Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                           max_temperature_f: 40, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 3,
                           mean_wind_speed_mph: 2, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-04', precipitation_inches: 0.9,
                           max_temperature_f: 44, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 6,
                           mean_wind_speed_mph: 3, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-05', precipitation_inches: 0.2,
                           max_temperature_f: 49, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 2,
                           mean_wind_speed_mph: 5, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-06', precipitation_inches: 0.34,
                           max_temperature_f: 50, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 5,
                           mean_wind_speed_mph: 6, mean_humidity: 20,
                           zip_code: 94107)


          Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

          expect((Condition.weather_on_day_with_highest_rides).ids).to eq([1])
        end

        it 'finds weather conditions for the lowest ride day' do

          Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                           max_temperature_f: 40, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 3,
                           mean_wind_speed_mph: 2, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-04', precipitation_inches: 0.9,
                           max_temperature_f: 44, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 6,
                           mean_wind_speed_mph: 3, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-05', precipitation_inches: 0.2,
                           max_temperature_f: 49, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 2,
                           mean_wind_speed_mph: 5, mean_humidity: 20,
                           zip_code: 94107)

          Condition.create(date: '2000-03-06', precipitation_inches: 0.34,
                           max_temperature_f: 50, min_temperature_f: 20,
                           mean_temperature_f: 35, mean_visibility_miles: 5,
                           mean_wind_speed_mph: 6, mean_humidity: 20,
                           zip_code: 94107)


          Trip.create(id: 4069, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4070, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4071, duration: 174, start_date: "2000-03-03 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4072, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4073, duration: 174, start_date: "2000-03-04 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4074, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4075, duration: 174, start_date: "2000-03-05 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)
          Trip.create(id: 4076, duration: 174, start_date: "2000-03-06 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94107)

          expect((Condition.weather_on_day_with_least_rides).ids).to eq([4])
        end
      end
  end

  describe "validations" do
    it "validates presence of date" do
      invalid_condition = Condition.new(precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20,
                                  zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of max_temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20,
                                  zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of precipitation" do
          invalid_condition = Condition.new(date: '12/01/2000',
                                      max_temperature_f: 50, min_temperature_f: 20,
                                      mean_temperature_f: 35, mean_visibility_miles: 10,
                                      mean_wind_speed_mph: 20, mean_humidity: 20,
                                      zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of min temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20,
                                  zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean_temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20,
                                  zip_code: 94107)
      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean visibility" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35,
                                  mean_wind_speed_mph: 20, mean_humidity: 20,
                                  zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean_wind_speed" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_humidity: 20, zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean humidity" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, zip_code: 94107)

      expect(invalid_condition).to_not be_valid
    end
  end
end
