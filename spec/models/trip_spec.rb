require_relative "../spec_helper"


describe "Trip" do
  describe "active record methods work correctly" do
    it "returns the id of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.id).to eq(4069)
    end

    it "returns the duration of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.duration).to eq(174)
    end

    it "returns the start_date of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)
      # binding.pry
      expect(trip.start_date).to eq("2013-08-29 00:00:00 UTC")
    end

    it "returns the start_station_name of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.start_station_name).to eq("2nd at South Park")
    end

    it "returns the start_station_id of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.start_station_id).to eq(64)
    end

    it "returns the end_date of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.end_date).to eq("2013-09-01 00:00:00 UTC")

    end

    it "returns the end_station_name of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.end_station_name).to eq("2nd at South Park")
    end

    it "returns the end_station_id of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.end_station_id).to eq(64)
    end

    it "returns the bike_id of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.bike_id).to eq(288)
    end

    it "returns the subscription_type of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.subscription_type).to eq("Subscriber")
    end

    it "returns the zip_code of the trip" do
      trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip.zip_code).to eq("94114")
    end

  end

  describe 'validates' do
    it "presence of duration" do
      invalid_trip = Trip.create(id: 4069, duration: nil, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of start_date" do
      invalid_trip = Trip.create(id: 4069, duration: 174, start_date: nil, start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of start_station_name" do
      invalid_trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: nil, start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of start_station_id" do
      invalid_trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: nil, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of end_date" do
      invalid_trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date: nil, end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of end_station_name" do
      invalid_trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: nil, end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of end_station_id" do
      invalid_trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: nil, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of bike_id" do
      invalid_trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: nil, subscription_type: "Subscriber", zip_code: 94114)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of subscription_type" do
      invalid_trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: nil, zip_code: 94114)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of zip_code" do
      invalid_trip = Trip.create(id: 4069, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 64, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: nil)

      expect(invalid_trip).to_not be_valid
    end

    describe "class methods" do
      describe ".average_duration" do
        it "averages the duration of the a ride" do
          Trip.create(duration: 63.0, start_date: "2013-08-29 00:00:00", start_station_name: "South Van Ness at Market", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 520.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2013-08-29 00:00:00", start_station_name: "San Jose City Hall", start_station_id: 10.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2013-08-29 00:00:00", start_station_name: "Mountain View City Hall", start_station_id: 27.0, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          # binding.pry
          expect(Trip.average_duration).to eq(68)
        end
      end

      describe ".longest_ride" do
        it "averages the duration of the a ride" do
          Trip.create(duration: 63.0, start_date: "2013-08-29 00:00:00", start_station_name: "South Van Ness at Market", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 520.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2013-08-29 00:00:00", start_station_name: "San Jose City Hall", start_station_id: 10.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2013-08-29 00:00:00", start_station_name: "Mountain View City Hall", start_station_id: 27.0, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          # binding.pry
          expect(Trip.longest_ride).to eq(71)
        end
      end

      describe "#shortest_ride" do
        it "averages the duration of the a ride" do
          Trip.create(duration: 63.0, start_date: "2013-08-29 00:00:00", start_station_name: "South Van Ness at Market", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 520.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2013-08-29 00:00:00", start_station_name: "San Jose City Hall", start_station_id: 10.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2013-08-29 00:00:00", start_station_name: "Mountain View City Hall", start_station_id: 27.0, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          expect(Trip.shortest_ride).to eq(63)
        end
      end

      describe ".most_popular_starting_station" do
        it "returns the station with the most rides as a starting place" do
          Trip.create(duration: 63.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 520.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Station.create(id: 66, name: "test_station_1", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 50, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          expect(Trip.most_popular_starting_station.name).to eq("test_station_1")
        end
      end

      describe ".most_popular_ending_station" do
        it "returns the station with the most rides as a starting place" do
          Trip.create(duration: 63.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 520.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Station.create(id: 66, name: "test_station_1", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 50, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 10, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          expect(Trip.most_popular_ending_station.name).to eq("test_station_2")
        end
      end

      describe ".month_by_month_breakdown" do
        it "returns a month_by_month_breakdown_for_2013" do

          Trip.create(duration: 70.0, start_date: "2013-03-24 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 63.0, start_date: "2013-01-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 520.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2013-04-01 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2013-03-01 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")


          Station.create(id: 66, name: "test_station_1", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 50, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          expect(Trip.month_by_month_breakdown_2013).to eq({"January"=>1, "March"=>2, "April"=>1})
        end

        it "returns a month_by_month_breakdown_for_2014" do

          Trip.create(duration: 70.0, start_date: "2014-03-24 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2014-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 63.0, start_date: "2014-01-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2014-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 520.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2014-04-01 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2014-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2014-03-01 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2014-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")


          Station.create(id: 66, name: "test_station_1", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 50, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          expect(Trip.month_by_month_breakdown_2014).to eq({"January"=>1, "March"=>2, "April"=>1})
        end

        it "returns a month_by_month_breakdown_for_2015" do

          Trip.create(duration: 70.0, start_date: "2015-03-24 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2015-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 63.0, start_date: "2015-01-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2015-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 520.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2015-04-01 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2015-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2015-03-01 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2015-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")


          Station.create(id: 66, name: "test_station_1", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 50, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          expect(Trip.month_by_month_breakdown_2015).to eq({"January"=>1, "March"=>2, "April"=>1})
        end
      end

      describe ".most_ridden_bike" do
        it "returns the most ridden bike and the total rides of that bike" do
          Trip.create(duration: 63.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2014-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")
          Trip.create(duration: 71.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 5.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")
          Trip.create(duration: 71.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 4.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Station.create(id: 66, name: "test_station_1", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 50, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          expect(Trip.most_ridden_bike.id).to eq(661)
          expect(Trip.most_ridden_bike.count).to eq(3)
        end
      end

      describe ".least_ridden_bike" do
        it "returns the least ridden bike and the total rides of that bike" do
          Trip.create(duration: 63.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2014-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Subscriber", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Station.create(id: 66, name: "test_station_1", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 50, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          expect(Trip.least_ridden_bike.id).to eq(48)
          expect(Trip.least_ridden_bike.count).to eq(1)
        end
      end

      describe ".subscriber" do
        it "returns the subscriber_type breakdown" do
          Trip.create(duration: 63.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2014-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2014-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Consumer", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Consumer", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Station.create(id: 66, name: "test_station_1", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 50, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          expect(Trip.subscribers.total).to eq(5)
          expect(Trip.subscribers.count).to eq(3)
          expect(Trip.subscribers.percent).to eq(60.0)
        end
      end

      describe ".customers" do
        it "returns the consumers breakdown" do
          Trip.create(duration: 63.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 94127.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2014-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2014-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 95138.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Consumer", zip_code: 95138.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Consumer", zip_code: 97214.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Station.create(id: 66, name: "test_station_1", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 50, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          expect(Trip.customers.total).to eq(5)
          expect(Trip.customers.count).to eq(2)
          expect(Trip.customers.percent).to eq(40.0)
        end
      end

      describe ".date_with_the_most_amount_of_trips" do
        it "returns the date with the most trips" do
          Trip.create(duration: 63.0, start_date: "2014-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 94107.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2014-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 94107.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2014-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 94107.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Consumer", zip_code: 94107.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Consumer", zip_code: 94107.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Station.create(id: 66, name: "test_station_1", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 50, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Condition.create(date: "2014-08-29 00:00:00", max_temperature_f: 74, mean_temperature_f: 68, min_temperature_f: 61, mean_humidity: 75, mean_wind_speed_mph: 11, precipitation_inches: 0, max_dew_point_f: nil, mean_dew_point_f: nil, min_dew_point_f: nil, max_humidity: nil, min_humidity: nil, max_sea_level_pressure_inches: nil, min_sea_level_pressure_inches: nil,
          mean_sea_level_pressure_inches: nil, max_visibility_miles: nil, min_visibility_miles: nil, max_gust_speed_mph: nil, max_wind_speed_mph: nil, cloud_cover: nil, wind_dir_degrees: nil, zip_code: 94107, mean_visibility_miles: 10, events: nil, created_at: "2016-12-06 01:01:22", updated_at: "2016-12-06 01:01:22")

          expect(Trip.date_with_the_most_trips.date).to eq("2014-08-29 00:00:00 UTC")
          expect(Trip.date_with_the_most_trips.count).to eq(3)
          expect(Trip.date_with_the_most_trips.weather).to be_a(Condition)
        end
      end

      describe ".date_with_the_least_amount_of_trips" do
        it "returns the date with the least_amount trips" do
          Trip.create(duration: 63.0, start_date: "2013-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "South Van Ness at Market", end_station_id: 66.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 94107.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2014-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 94107.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2014-08-29 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Subscriber", zip_code: 94107.0, created_at: "2016-12-05
          19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 70.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_1", start_station_id: 66.0, end_date: "2013-08-29 00:00:00", end_station_name: "San Jose City Hall", end_station_id: 10.0, bike_id: 661.0, subscription_type: "Consumer", zip_code: 94107.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Trip.create(duration: 71.0, start_date: "2015-10-01 00:00:00", start_station_name: "test_station_2", start_station_id: 50, end_date: "2013-08-29 00:00:00", end_station_name: "Mountain View City Hall", end_station_id: 27.0, bike_id: 48.0, subscription_type: "Consumer", zip_code: 94107.0, created_at: "2016-12-05 19:40:06", updated_at: "2016-12-05 19:40:06")

          Station.create(id: 66, name: "test_station_1", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Station.create(id: 50, name: "test_station_2", lat: nil, long: nil, dock_count: 19, city: "San Francisco", installation_date: "2013-08-23 00:00:00", created_at: "2016-12-06 00:31:54", updated_at: "2016-12-06 00:31:54")

          Condition.create(date: "2013-08-29 00:00:00", max_temperature_f: 74, mean_temperature_f: 68, min_temperature_f: 61, mean_humidity: 75, mean_wind_speed_mph: 11, precipitation_inches: 0, max_dew_point_f: nil, mean_dew_point_f: nil, min_dew_point_f: nil, max_humidity: nil, min_humidity: nil, max_sea_level_pressure_inches: nil, min_sea_level_pressure_inches: nil,
          mean_sea_level_pressure_inches: nil, max_visibility_miles: nil, min_visibility_miles: nil, max_gust_speed_mph: nil, max_wind_speed_mph: nil, cloud_cover: nil, wind_dir_degrees: nil, zip_code: 94107, mean_visibility_miles: 10, events: nil, created_at: "2016-12-06 01:01:22", updated_at: "2016-12-06 01:01:22")

          expect(Trip.date_with_the_least_trips.date).to eq("2013-08-29 00:00:00 UTC")
          expect(Trip.date_with_the_least_trips.count).to eq(1)
          expect(Trip.date_with_the_least_trips.weather).to be_a(Condition)
        end
      end
    end
  end
end
