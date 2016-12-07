require_relative '../spec_helper'

describe "Trip" do

  describe "validations" do
    it "will not save without duration" do
      invalid_trip = Trip.create(start_date: "2011-3-6 12:00",
                                start_station_id: 1,
                                end_date: "2011-3-6 12:00",
                                end_station_id: 3,
                                bike_id: 3,
                                subscription_id: 1,
                                zipcode: 80211)

      expect(invalid_trip).to_not be_valid
    end

    it "will not save without start_date and start_station_id" do
      invalid_trip1 = Trip.create(duration: 45,
                                  start_station_id: 1,
                                  end_date: "2011-3-6 12:00",
                                  end_station_id: 3,
                                  bike_id: 3,
                                  subscription_id: 1,
                                  zipcode: 80211)
      invalid_trip2 = Trip.create(start_station_id: 1,
                                  end_date: "2011-3-6 12:00",
                                  end_station_id: 3,
                                  bike_id: 3,
                                  subscription_id: 1,
                                  zipcode: 80211)
      
      expect(invalid_trip1).to_not be_valid
      expect(invalid_trip2).to_not be_valid
    end

    it "will not save without end_date and end_station_id" do
      invalid_trip1 = Trip.create(duration: 45,
                                  start_station_id: 1,
                                  end_date: "2011-3-6 12:00",
                                  end_station_id: 3,
                                  bike_id: 3,
                                  subscription_id: 1,
                                  zipcode: 80211)
      invalid_trip2 = Trip.create(duration: 45,
                                  start_date:  "2011-3-6 12:00",
                                  start_station_id: 1,
                                  end_station_id: 3,
                                  bike_id: 3,
                                  subscription_id: 1,
                                  zipcode: 80211)

      expect(invalid_trip1).to_not be_valid
      expect(invalid_trip2).to_not be_valid
    end

    it "will not save without zipcode" do
      invalid_trip = Trip.create(duration: 45,
                                start_date: "2011-3-6 12:00",
                                start_station_id: 1,
                                end_date: "2011-3-6 12:00",
                                end_station_id: 3,
                                bike_id: 3,
                                subscription_id: 1)
      expect(invalid_trip).to_not be_valid
    end

    it "will not save without subscription_type" do
      invalid_trip = Trip.create(duration: 45,
                                start_date: "2011-3-6 12:00",
                                start_station_id: 1,
                                end_date: "2011-3-6 12:00",
                                end_station_id: 3,
                                bike_id: 3,
                                zipcode: 80211)
      expect(invalid_trip).to_not be_valid
    end
  end

  describe "Methods" do
    describe "average duration of a ride" do
      it "returns nil when no trips are in database table" do
        expect(Trip.average_duration_of_a_ride).to eq(nil)
      end
      it "returns proper value with one entry in database table" do
        test_trip = Trip.write(duration: 90,
                                  start_date: "2011-3-6 12:00",
                                  start_station_id: 1,
                                  end_date: "2011-3-6 12:00",
                                  end_station_id: 3,
                                  bike_id: 3,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80211)
                                  
        expect(Trip.average_duration_of_a_ride).to eq(90)
      end
      it "returns proper value with more than one entry in database table" do
        test_trip1 = Trip.write(duration: 90,
                                  start_date: "2011-3-6 12:00",
                                  start_station_id: 1,
                                  end_date: "2011-3-6 12:00",
                                  end_station_id: 3,
                                  bike_id: 3,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80211)
        test_trip2 = Trip.write(duration: 45,
                                  start_date: "2011-6-6 12:00",
                                  start_station_id: 1,
                                  end_date: "2011-6-6 12:00",
                                  end_station_id: 3,
                                  bike_id: 3,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80211)
                                  
        expect(Trip.average_duration_of_a_ride).to eq(67.5)
      end
    end
    describe "stations with most rides as starting place" do
      it "Return Station object from which most rides started from" do
        test_trip1 = Trip.write(duration: 90,
                                  start_date: "2011-3-6 12:00",
                                  start_station_id: 1,
                                  end_date: "2011-3-6 12:00",
                                  end_station_id: 3,
                                  bike_id: 3,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80211)
        test_trip2 = Trip.write(duration: 100,
                                  start_date: "2012-2-2 12:00",
                                  start_station_id: 10,
                                  end_date: "2012-2-6 12:00",
                                  end_station_id: 3,
                                  bike_id: 6,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80222)
        test_trip3 = Trip.write(duration: 200,
                                  start_date: "2013-3-3 12:00",
                                  start_station_id: 10,
                                  end_date: "2013-3-6 12:00",
                                  end_station_id: 15,
                                  bike_id: 4,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80333)
        test_station10 = Station.write(name: "TestStation10",
                                        lat: 1.1,
                                        long: 1.2,
                                        dock_count: 10,
                                        city_name: "TestCityName10",
                                        installation_date: "2011-11-11",
                                        csv_id: 10)
        test_station3 = Station.write(name: "TestStation3",
                                      lat: 3.1,
                                      long: 3.2,
                                      dock_count: 3,
                                      city_name: "TestCityName3",
                                      installation_date: "2011-11-11",
                                      csv_id: 3)

        expect(Trip.station_with_most_rides_as_starting_place.name).to eq(test_station10.name)
      end
    end
  end

  describe "Database relations" do
    it "Returns Station object for trip start station" do
      test_trip = Trip.write(duration: 90,
                                start_date: "2011-3-6 12:00",
                                start_station_id: 1,
                                end_date: "2011-3-6 12:00",
                                end_station_id: 3,
                                bike_id: 3,
                                subscription_type: "Subscriber", 
                                zipcode: 80211)
      test_start_station = Station.write(name: "TestStation1",
                                        lat: 1.1,
                                        long: 1.2,
                                        dock_count: 1,
                                        city_name: "TestCityName1",
                                        installation_date: "2011-11-11",
                                        csv_id: 1
                                        )
      test_end_station = Station.write(name: "TestStation3",
                                        lat: 3.1,
                                        long: 3.2,
                                        dock_count: 3,
                                        city_name: "TestCityName3",
                                        installation_date: "2011-11-11",
                                        csv_id: 3
                                        )

      expect(test_trip.start_station.name).to eq(test_start_station.name)
    end
    it "Returns Station object for trip end station" do
      test_trip = Trip.write(duration: 90,
                                start_date: "2011-3-6 12:00",
                                start_station_id: 1,
                                end_date: "2011-3-6 12:00",
                                end_station_id: 3,
                                bike_id: 3,
                                subscription_type: "Subscriber", 
                                zipcode: 80211)
      test_start_station = Station.write(name: "TestStation1",
                                        lat: 1.1,
                                        long: 1.2,
                                        dock_count: 1,
                                        city_name: "TestCityName1",
                                        installation_date: "2011-11-11",
                                        csv_id: 1
                                        )
      test_end_station = Station.write(name: "TestStation3",
                                        lat: 3.1,
                                        long: 3.2,
                                        dock_count: 3,
                                        city_name: "TestCityName3",
                                        installation_date: "2011-11-11",
                                        csv_id: 3
                                        )

      expect(test_trip.end_station.name).to eq(test_end_station.name)
    end
  end

end