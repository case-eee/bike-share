require_relative "../spec_helper"

describe "Station" do
  describe "Validations" do
    it "Can save if all fields are present" do
      Station.write(name: "TestStation1",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 1,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )

      expect(Station.find(1).name).to eq("TestStation1")
    end
    it "Will not save if name is not populated" do
      invalid_station = Station.new(lat: 1.1,
                                    long: 1.2,
                                    dock_count: 1,
                                    city_id: 1,
                                    installation_date: "2011-11-11"
                                    )

      expect(invalid_station).to_not be_valid
    end
    it "Will not save if dock_count is not populated" do
      invalid_station = Station.new(name: "TestStation1",
                                    lat: 1.1,
                                    long: 1.2,
                                    city_id: 1,
                                    installation_date: "2011-11-11"
                                    )

      expect(invalid_station).to_not be_valid
    end
    it "Will not save if city_id is not populated" do
      invalid_station = Station.new(name: "TestStation1",
                                    lat: 1.1,
                                    long: 1.2,
                                    dock_count: 1,
                                    installation_date: "2011-11-11"
                                    )

      expect(invalid_station).to_not be_valid
    end
    it "Will not save if installation_date is not populated" do
      invalid_station = Station.new(name: "TestStation1",
                                    lat: 1.1,
                                    long: 1.2,
                                    dock_count: 1,
                                    city_id: 1
                                    )

      expect(invalid_station).to_not be_valid
    end
    it "Can save station with correct city_id from list of multiple cities" do
      first_city = City.write(name: "FirstCity")
      second_city = City.write(name: "SecondCity")
      Station.write(name: "TestStation1",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 1,
                    city_name: "SecondCity",
                    installation_date: "2011-11-11"
                    )

      expect(Station.find(1).city_id).to eq(second_city.id)
    end
  end

  describe "Iteration 3 methods" do
    describe "oldest_station" do
      it "Returns nil if database is empty" do
        expect(Station.oldest_station).to eq(nil)
      end
      it "Returns oldest station saved in database" do
        Station.write(name: "ThisStation",
                      lat: 1.1,
                      long: 1.2,
                      dock_count: 1,
                      city_name: "TestCityName1",
                      installation_date: "2011-11-11")
        Station.write(name: "ThisOtherStation",
                      lat: 1.4,
                      long: 7,
                      dock_count: 1,
                      city_name: "TestCityName1",
                      installation_date: "2012-11-11")
        oldest = Station.oldest_station

        expect(oldest.name).to eq("ThisStation")
      end

    end

    describe "most_recently_installed_station" do
      it "Returns nil if database is empty" do
        expect(Station.most_recently_installed_station).to eq(nil)
      end
      it "Returns newest station in database" do
        Station.write(name: "ThisStation",
                      lat: 1.1,
                      long: 1.2,
                      dock_count: 1,
                      city_name: "TestCityName1",
                      installation_date: "2011-11-11")
        Station.write(name: "ThisOtherStation",
                      lat: 1.4,
                      long: 7,
                      dock_count: 1,
                      city_name: "TestCityName1",
                      installation_date: "2012-11-11")
        newest = Station.most_recently_installed_station

        expect(newest.name).to eq("ThisOtherStation")
      end
    end

    describe "average_bikes_per_station" do
      it "Returns nil if database is empty" do
        expect(Station.average_bikes_per_station).to eq(nil)
      end
      it "Returns average dock_count of stations" do
        Station.write(name: "ThisStation",
                      lat: 1.1,
                      long: 1.2,
                      dock_count: 2,
                      city_name: "TestCityName1",
                      installation_date: "2011-11-11")
        Station.write(name: "ThisOtherStation",
                      lat: 1.4,
                      long: 7,
                      dock_count: 3,
                      city_name: "TestCityName1",
                      installation_date: "2012-11-11")
        
        expect(Station.average_bikes_per_station).to eq(2.5)
      end 
    end
    
    describe "most_bikes method" do
      it "Returns nil when table has NO stations" do
        expect(Station.most_bikes).to eq(nil)
      end
      it "Returns correct value when table has 1 station" do
        test_station1 = Station.write(name: "TestStation1",
                                      lat: 1.1,
                                      long: 1.2,
                                      dock_count: 1,
                                      city_name: "TestCityName1",
                                      installation_date: "2011-11-11"
                                      )

        expect(Station.most_bikes).to eq(test_station1.dock_count)
      end
      it "Returns correct value when table has more than stations" do
        test_station1 = Station.write(name: "TestStation1",
                                      lat: 1.1,
                                      long: 1.2,
                                      dock_count: 1,
                                      city_name: "TestCityName1",
                                      installation_date: "2011-11-11"
                                      )
        test_station2 = Station.write(name: "TestStation2",
                                      lat: 2.1,
                                      long: 2.2,
                                      dock_count: 2,
                                      city_name: "TestCityName2",
                                      installation_date: "2012-12-22"
                                      )
        
        expect(Station.most_bikes).to eq(test_station2.dock_count)
      end
    end
    describe "find_by_most_bikes method" do
      it "Returns empty list value when table has NO stations" do
        expect(Station.find_by_most_bikes.count).to eq(0)
        expect(Station.find_by_most_bikes).to eq([])
      end
      it "Returns correct row when table has 1 station" do
        test_station1 = Station.write(name: "TestStation1",
                                      lat: 1.1,
                                      long: 1.2,
                                      dock_count: 1,
                                      city_name: "TestCityName1",
                                      installation_date: "2011-11-11"
                                      )

        expect(Station.find_by_most_bikes.count).to eq(1)
        expect(Station.find_by_most_bikes.first).to eq(test_station1)
      end
      it "Returns list with one station when table has more than stations AND only one station's dock_count matches most_bikes value" do
        test_station1 = Station.write(name: "TestStation1",
                                      lat: 1.1,
                                      long: 1.2,
                                      dock_count: 1,
                                      city_name: "TestCityName1",
                                      installation_date: "2011-11-11"
                                      )
        test_station2 = Station.write(name: "TestStation2",
                                      lat: 2.1,
                                      long: 2.2,
                                      dock_count: 2,
                                      city_name: "TestCityName2",
                                      installation_date: "2012-12-22"
                                      )
        
        expect(Station.find_by_most_bikes.count).to eq(1)
        expect(Station.find_by_most_bikes.first).to eq(test_station2)
      end
      it "Returns list when table has more than stations AND more than one station's dock_count matches most_bikes value" do
        test_station1 = Station.write(name: "TestStation1",
                                      lat: 1.1,
                                      long: 1.2,
                                      dock_count: 1,
                                      city_name: "TestCityName1",
                                      installation_date: "2011-11-11"
                                      )
        test_station2 = Station.write(name: "TestStation2",
                                      lat: 2.1,
                                      long: 2.2,
                                      dock_count: 10,
                                      city_name: "TestCityName2",
                                      installation_date: "2012-12-22"
                                      )
        test_station3 = Station.write(name: "TestStation3",
                                      lat: 2.1,
                                      long: 2.2,
                                      dock_count: 10,
                                      city_name: "TestCityName3",
                                      installation_date: "2013-12-23"
                                      )
        expect(Station.find_by_most_bikes.count).to eq(2)
        expect(Station.find_by_most_bikes.first).to eq(test_station2)
        expect(Station.find_by_most_bikes.last).to eq(test_station3)
      end
    end
    describe "fewest_bikes" do
      it "Returns nil when table has NO stations" do
        expect(Station.fewest_bikes).to eq(nil)
      end
      it "Returns correct value when table has 1 station" do
        ts1 = Station.write(name: "Test Station",
                            lat: 1.1,
                            long: 1.2,
                            dock_count: 3,
                            city_name: "Test City",
                            installation_date: "2000-12-12"
                            )
        expect(Station.fewest_bikes).to eq(ts1.dock_count)
      end
      it "Returns correct value when table has more than 1 stations" do
        Station.write(name: "Test1",
                      lat: 1.0,
                      long: 2.0,
                      dock_count: 3,
                      city_name: "Test City",
                      installation_date: "2001-11-11"
                      )
        Station.write(name: "Test2",
                      lat: 1.0,
                      long: 2.0,
                      dock_count: 1,
                      city_name: "Test Town",
                      installation_date: "2001-11-20"
                      )
                              
        expect(Station.fewest_bikes).to eq(1)
      end
    end
    describe "find_by_fewest_bikes" do
      it "Returns empty list value when table has NO stations"  do
        expect(Station.find_by_fewest_bikes.empty?).to eq(true)
        expect(Station.find_by_fewest_bikes).to eq([])
      end
      it "Returns correct row when table has 1 station" do
        test = Station.write(name: "Test Town",
                      lat: 2.0,
                      long: 3.0,
                      dock_count: 10,
                      city_name: "Test City",
                      installation_date: "2012-09-23"
                      )

        expect(Station.find_by_fewest_bikes[0]).to eq(test)
      end
      it "Returns list with one station when table has more than one station AND only one station matching criteria" do
        test = Station.write(name: "Test Town",
                      lat: 2.0,
                      long: 3.0,
                      dock_count: 10,
                      city_name: "Test City",
                      installation_date: "2012-09-23"
                      )
                Station.write(name: "Test Town",
                      lat: 2.0,
                      long: 3.0,
                      dock_count: 30,
                      city_name: "Test City",
                      installation_date: "2012-09-23"
                      )

        expect(Station.find_by_fewest_bikes[0]).to eq(test)
        expect(Station.find_by_fewest_bikes.count).to eq(1)
      end
      it "Returns list with more than one station when there are multiple matching stations matching criteria" do
        Station.write(name: "Test Town",
                      lat: 2.0,
                      long: 3.0,
                      dock_count: 10,
                      city_name: "Test City",
                      installation_date: "2012-09-23"
                      )
        Station.write(name: "Test Townvil",
                      lat: 2.0,
                      long: 4.0,
                      dock_count: 30,
                      city_name: "Test Village",
                      installation_date: "2012-03-23"
                      )
        Station.write(name: "Test",
                      lat: 1.0,
                      long: 2.0,
                      dock_count: 10,
                      city_name: "City",
                      installation_date: "2012-04-23"
                      )

        expect(Station.find_by_fewest_bikes.count).to eq(2)
      end
    end
  end

  describe "Database relations" do
    it "Returns list of Trip objects where station was start station for trip" do
      test_start_station = Station.write(name: "StartStation",
                                        lat: 1.1,
                                        long: 1.2,
                                        dock_count: 1,
                                        city_name: "TestCityName1",
                                        installation_date: "2011-11-11",
                                        )
      test_end_station = Station.write(name: "EndStation",
                                        lat: 3.1,
                                        long: 3.2,
                                        dock_count: 3,
                                        city_name: "TestCityName3",
                                        installation_date: "2011-11-11",
                                        )
      test_trip1 = Trip.write(duration: 90,
                              start_date: "2011-3-6 12:00",
                              start_station_name: "StartStation",
                              end_date: "2011-3-6 12:00",
                              end_station_name: "EndStation",
                              bike_id: 3,
                              subscription_type: "Subscriber", 
                              zipcode: 80211)
      test_trip2 = Trip.write(duration: 100,
                              start_date: "2012-2-2 12:00",
                              start_station_name: "StartStation",
                              end_date: "2012-2-6 12:00",
                              end_station_name: "EndStation",
                              bike_id: 6,
                              subscription_type: "Subscriber", 
                              zipcode: 80222)

      expect(test_start_station.start_trips.count).to eq(2)
      expect(test_start_station.start_trips.first.duration).to eq(test_trip1.duration)
    end
    it "Returns lits of Trip objects where station was end station for trip" do
      test_start_station = Station.write(name: "TestStation1",
                                          lat: 1.1,
                                          long: 1.2,
                                          dock_count: 1,
                                          city_name: "TestCityName1",
                                          installation_date: "2011-11-11",
                                          )
      test_end_station = Station.write(name: "TestStation3",
                                        lat: 3.1,
                                        long: 3.2,
                                        dock_count: 3,
                                        city_name: "TestCityName3",
                                        installation_date: "2011-11-11",
                                        )
      test_trip1 = Trip.write(duration: 90,
                                start_date: "2011-3-6 12:00",
                                start_station_name: "TestStation1",
                                end_date: "2011-3-6 12:00",
                                end_station_name: "TestStation3",
                                bike_id: 3,
                                subscription_name: "Subscriber", 
                                zipcode: 80211)
      test_trip2 = Trip.write(duration: 100,
                                start_date: "2012-2-2 12:00",
                                start_station_name: "TestStation1",
                                end_date: "2012-2-6 12:00",
                                end_station_name: "TestStation3",
                                bike_id: 6,
                                subscription_type: "Subscriber", 
                                zipcode: 80222)

      expect(test_end_station.end_trips.count).to eq(2)
      expect(test_end_station.end_trips.first.duration).to eq(test_trip1.duration)
      expect(test_end_station.end_trips.last.duration).to eq(test_trip2.duration)
    end
    it "Returns date on which the most trips started from the station" do
      test_start_station = Station.write(name: "StartStation",
                                        lat: 1.1,
                                        long: 1.2,
                                        dock_count: 1,
                                        city_name: "TestCityName1",
                                        installation_date: "2011-11-11",
                                        )
      test_trip1 = Trip.write(duration: 90,
                              start_date: "2011-3-6 12:00",
                              start_station_name: "StartStation",
                              end_date: "2011-3-6 12:00",
                              end_station_name: "EndStation",
                              bike_id: 3,
                              subscription_type: "Subscriber", 
                              zipcode: 80211)
      test_trip2 = Trip.write(duration: 100,
                              start_date: "2012-2-2 12:00",
                              start_station_name: "StartStation",
                              end_date: "2012-2-6 12:00",
                              end_station_name: "EndStation",
                              bike_id: 6,
                              subscription_type: "Subscriber", 
                              zipcode: 80222)
      test_trip3 = Trip.write(duration: 190,
                              start_date: "2011-3-6 12:00",
                              start_station_name: "StartStation",
                              end_date: "2011-3-7 12:00",
                              end_station_name: "EndStation",
                              bike_id: 5,
                              subscription_type: "Subscriber", 
                              zipcode: 80233)

      expect(test_start_station.start_trips.count).to eq(3)
      expect(test_start_station.start_trips.date_of_highest_number_of_trips).to eq(test_trip1.start_date.to_s)
    end
    it "Returns date on which the most trips started from the station" do
      test_start_station = Station.write(name: "StartStation",
                                        lat: 1.1,
                                        long: 1.2,
                                        dock_count: 1,
                                        city_name: "TestCityName1",
                                        installation_date: "2011-11-11",
                                        )
      test_trip1 = Trip.write(duration: 90,
                              start_date: "2011-3-6 12:00",
                              start_station_name: "StartStation",
                              end_date: "2011-3-6 12:00",
                              end_station_name: "EndStation",
                              bike_id: 3,
                              subscription_type: "Subscriber", 
                              zipcode: 80211)
      test_trip2 = Trip.write(duration: 100,
                              start_date: "2012-2-2 12:00",
                              start_station_name: "StartStation",
                              end_date: "2012-2-6 12:00",
                              end_station_name: "EndStation",
                              bike_id: 6,
                              subscription_type: "Subscriber", 
                              zipcode: 80222)
      test_trip3 = Trip.write(duration: 190,
                              start_date: "2011-3-6 12:00",
                              start_station_name: "StartStation",
                              end_date: "2011-3-7 12:00",
                              end_station_name: "EndStation",
                              bike_id: 5,
                              subscription_type: "Subscriber", 
                              zipcode: 80233)

      expect(test_start_station.start_trips.count).to eq(3)
      expect(test_start_station.start_trips.trip_count_of_highest_number_of_trips).to eq(2)
    end

  end
  describe "Iteration 6 methods" do

    it "find the most frequent zipcode for users starting at a station" do
      Station.write(name: "TestStation1",
                                      lat: 1.1,
                                      long: 1.2,
                                      dock_count: 1,
                                      city_name: "TestCityName1",
                                      installation_date: "2011-11-11")
      test_station3 = Station.write(name: "TestStation3",
                                        lat: 3.1,
                                        long: 3.2,
                                        dock_count: 3,
                                        city_name: "TestCityName3",
                                        installation_date: "2011-11-11")
      test_trip1 = Trip.write(duration: 90,
                                start_date: "2011-3-6 12:00",
                                start_station_name: "TestStation3",
                                end_date: "2011-3-6 12:00",
                                end_station_name: "TestStation3",
                                bike_id: 3,
                                subscription_name: "Subscriber", 
                                zipcode: 80211)
      test_trip2 = Trip.write(duration: 100,
                                start_date: "2012-2-2 12:00",
                                start_station_name: "TestStation3",
                                end_date: "2012-2-6 12:00",
                                end_station_name: "TestStation3",
                                bike_id: 6,
                                subscription_type: "Subscriber", 
                                zipcode: 80222)
      test_trip3 = Trip.write(duration: 100,
                                start_date: "2012-2-2 12:00",
                                start_station_name: "TestStation3",
                                end_date: "2012-2-6 12:00",
                                end_station_name: "TestStation1",
                                bike_id: 6,
                                subscription_type: "Subscriber", 
                                zipcode: 80222)

      expect(test_station3.most_frequent_user_zipcode_as_start_station).to eq(80222)
    end
    it "find the most frequently used bike at this station" do
      Station.write(name: "BikeStation",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 1,
                    city_name: "TestTown",
                    installation_date: "2011-11-24")
      Trip.write(duration: 90,
                start_date: "2011-3-6 12:00",
                start_station_name: "BikeStation",
                end_date: "2011-3-6 12:00",
                end_station_name: "TestStation3",
                bike_id: 3,
                subscription_name: "Subscriber", 
                zipcode: 80211)
      expect(Station.first.start_trips.bike_most_used_starting).to eq(3)
    end

  end
end