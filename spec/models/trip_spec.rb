require_relative "../spec_helper"


describe "Trip" do
  describe ".duration" do
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

      expect(trip.zip_code).to eq(94114)
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

  end
end
