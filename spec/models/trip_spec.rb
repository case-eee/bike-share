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
    describe "Average duration of a ride" do
      it "Returns nil when no trips are in database table" do
        expect(Trip.average_duration_of_a_ride).to eq(nil)
      end
      it "Returns proper value with one entry in database table" do
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
      it "Returns proper value with more than one entry in database table" do
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
    describe "Stations with most rides as starting place" do
      it "Return Station object from which most rides started from" do
        test_station1 = Station.write(name: "TestStation1",
                                      lat: 1.1,
                                      long: 1.2,
                                      dock_count: 1,
                                      city_name: "TestCityName1",
                                      installation_date: "2011-11-11",
                                      )
        test_station10 = Station.write(name: "TestStation10",
                                        lat: 1.1,
                                        long: 1.2,
                                        dock_count: 10,
                                        city_name: "TestCityName10",
                                        installation_date: "2011-11-11",
                                        )
        test_station3 = Station.write(name: "TestStation3",
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
                                  subscription_type: "Subscriber", 
                                  zipcode: 80211)
        test_trip2 = Trip.write(duration: 100,
                                  start_date: "2012-2-2 12:00",
                                  start_station_name: "TestStation10",
                                  end_date: "2012-2-6 12:00",
                                  end_station_name: "TestStation3",
                                  bike_id: 6,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80222)
        test_trip3 = Trip.write(duration: 200,
                                  start_date: "2013-3-3 12:00",
                                  start_station_name: "TestStation10",
                                  end_date: "2013-3-6 12:00",
                                  end_station_name: "TestStation1",
                                  bike_id: 4,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80333)

        expect(Trip.station_with_most_rides_as_starting_place.name).to eq(test_station10.name)
      end
    end
    describe "Most ridden bike with total number of rides for that bike" do
      it "Returns hash with bike_id and number of rides" do
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
                                  bike_id: 3,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80333)

        expect(Trip.most_ridden_bike_with_total_number_of_rides_for_that_bike[:most_ridden_bike_id]).to eq(3)
        expect(Trip.most_ridden_bike_with_total_number_of_rides_for_that_bike[:total_number_of_rides]).to eq(2)
      end
    end
    describe "Date with highest number of trips" do
      it "Returns date" do
        test_trip1 = Trip.write(duration: 90,
                                  start_date: "2011-3-6 12:00",
                                  start_station_id: 1,
                                  end_date: "2011-3-6 12:00",
                                  end_station_id: 3,
                                  bike_id: 3,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80211)
        test_trip2 = Trip.write(duration: 100,
                                  start_date: "2011-3-6 12:00",
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
                                  bike_id: 3,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80333)

        expect(Trip.date_with_highest_number_of_trips_with_count_of_those_trips[:date_with_most_trips].to_s).to eq("2011-03-06")
      end
      it "Returns count" do
        test_trip1 = Trip.write(duration: 90,
                                  start_date: "2011-3-6 12:00",
                                  start_station_id: 1,
                                  end_date: "2011-3-6 12:00",
                                  end_station_id: 3,
                                  bike_id: 3,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80211)
        test_trip2 = Trip.write(duration: 100,
                                  start_date: "2011-3-6 12:00",
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
                                  bike_id: 3,
                                  subscription_type: "Subscriber", 
                                  zipcode: 80333)

        expect(Trip.date_with_highest_number_of_trips_with_count_of_those_trips[:total_number_of_rides]).to eq(2)
      end
    end

    describe "Shortest duration of a ride" do
      it "Returns nil when no trips are in database" do
        expect(Trip.shortest_ride).to eq(nil)
      end
      it "Returns proper value with more than one entry" do
        Trip.write(duration: 90,
                   start_date: "2011-3-6 12:00",
                   start_station_id: 1,
                   end_date: "2011-3-6 12:00",
                   end_station_id: 3,
                   bike_id: 3,
                   subscription_type: "Subscriber", 
                   zipcode: 80211)
        Trip.write(duration: 40,
                   start_date: "2011-3-6 12:00",
                   start_station_id: 1,
                   end_date: "2011-3-6 12:00",
                   end_station_id: 3,
                   bike_id: 3,
                   subscription_type: "Subscriber", 
                   zipcode: 80211)

        expect(Trip.shortest_ride).to eq(40)
      end
    end
    describe "Monthly rides" do
      it "Returns data with rides broken up by month" do
        Trip.write(duration: 90,
                   start_date: "2011-3-6 12:00",
                   start_station_name: "TestStation1",
                   end_date: "2011-3-6 12:00",
                   end_station_name: "TestStation3",
                   bike_id: 3,
                   subscription_type: "Subscriber", 
                   zipcode: 80211)
        expect(Trip.monthly_rides.values[0]).to eq(1)
        expect(Trip.monthly_breakdown_of_rides[:monthly_breakdown][0].month).to eq(3)
      end
    end
    describe "Subscription types" do
      xit "returns nil with no entries in database" do
        expect(Trip.subscription_types).to eq(nil)
      end
      xit "Returns correct number and percent with one entry" do
        Station.write(name: "TestStation1",
                      lat: 1.1,
                      long: 1.2,
                      dock_count: 1,
                      city_name: "TestCityName1",
                      installation_date: "2011-11-11",
                      )
        Trip.write(duration: 90,
                  start_date: "2011-3-6 12:00",
                  start_station_name: "TestStation1",
                  end_date: "2011-3-6 12:00",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        expect(Trip.subscription_types).to eq([1, 100])
      end
      it "Returns correct number and percent with two entry" do
        Station.write(name: "TestStation1",
                      lat: 1.1,
                      long: 1.2,
                      dock_count: 1,
                      city_name: "TestCityName1",
                      installation_date: "2011-11-11",
                      )
        Trip.write(duration: 90,
                  start_date: "2011-3-6 12:00",
                  start_station_name: "TestStation1",
                  end_date: "2011-3-6 12:00",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 90,
                  start_date: "2011-3-6 12:00",
                  start_station_name: "TestStation1",
                  end_date: "2011-3-6 12:00",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Customer", 
                  zipcode: 80211)

        expect(Trip.subscription_types[:subscriber_percentage]).to eq(50.0)
        expect(Trip.subscription_types[:customer_percentage]).to eq(50.0)
      end
    end
  end

  describe "Database relations" do
    it "Returns Station object for trip start station" do
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
      test_trip = Trip.write(duration: 90,
                            start_date: "2011-3-6 12:00",
                            start_station_name: "TestStation1",
                            end_date: "2011-3-6 12:00",
                            end_station_name: "TestStation3",
                            bike_id: 3,
                            subscription_type: "Subscriber", 
                            zipcode: 80211)

      expect(test_trip.start_station.name).to eq(test_start_station.name)
    end

    it "Returns Station object for trip end station" do
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
      test_trip = Trip.write(duration: 90,
                              start_date: "2011-3-6 12:00",
                              start_station_name: "TestStation1",
                              end_date: "2011-3-6 12:00",
                              end_station_name: "TestStation3",
                              bike_id: 3,
                              subscription_type: "Subscriber", 
                              zipcode: 80211)

      expect(test_trip.end_station.name).to eq(test_end_station.name)
    end
  end

  describe "Dashboard Methods" do
    it "find the longest ride" do
      trip1 = Trip.write(duration: 45,
                          start_date: "2011-3-6 12:00",
                          start_station_id: 1,
                          end_date: "2011-3-6 12:00",
                          end_station_id: 3,
                          bike_id: 3,
                          subscription_name: "Subscriber",
                          zipcode: 80211)
      trip2 = Trip.write(duration: 47,
                          start_date: "2011-3-6 12:00",
                          start_station_id: 1,
                          end_date: "2011-3-6 12:00",
                          end_station_id: 3,
                          subscription_name: "Subscriber",
                          bike_id: 3,
                          zipcode: 80211)

      expect(Trip.longest_ride).to eq(47)
    end

    it "find the station with the most rides as a starting place" do
      Station.write(name: "MostCommon", 
                    dock_count: 7,
                    city_name: "City",
                    installation_date: "2013-11-11")
      Station.write(name: "LeastCommon", 
                    dock_count: 7,
                    city_name: "City",
                    installation_date: "2013-11-11")
      trip1 = Trip.write(duration: 45,
                          start_date: "2011-3-6 12:00",
                          start_station_name: "MostCommon",
                          end_date: "2011-3-6 12:00",
                          end_station_name: "LeastCommon",
                          bike_id: 3,
                          subscription_name: "Subscriber",
                          zipcode: 80211)
      trip2 = Trip.write(duration: 47,
                          start_date: "2011-3-6 12:00",
                          start_station_name: "LeastCommon",
                          end_date: "2011-3-6 12:00",
                          end_station_name: "MostCommon",
                          subscription_name: "Subscriber",
                          bike_id: 3,
                          zipcode: 80211)
      trip3 = Trip.write(duration: 47,
                          start_date: "2011-3-6 12:00",
                          start_station_name: "MostCommon",
                          end_date: "2011-3-6 12:00",
                          end_station_name: "LeastCommon",
                          subscription_name: "Subscriber",
                          bike_id: 3,
                          zipcode: 80211)

      expect(Trip.station_with_most_starting_rides.name).to eq("MostCommon")
    end

    it "find the least ridden bike with total number of rides" do
      Station.write(name: "StartStation", 
                    dock_count: 7,
                    city_name: "City",
                    installation_date: "2013-11-11")
      Station.write(name: "EndStation", 
                    dock_count: 7,
                    city_name: "City",
                    installation_date: "2013-11-11")
      trip1 = Trip.write(duration: 45,
                          start_date: "2011-3-6 12:00",
                          start_station_name: "StartStation",
                          end_date: "2011-3-6 12:00",
                          end_station_name: "EndStation",
                          bike_id: 2,
                          subscription_name: "Subscriber",
                          zipcode: 80211)
      trip2 = Trip.write(duration: 47,
                          start_date: "2011-3-7 12:00",
                          start_station_name: "StartStation",
                          end_date: "2011-3-6 12:00",
                          end_station_name: "EndStation",
                          subscription_name: "Subscriber",
                          bike_id: 3,
                          zipcode: 80211)
      trip3 = Trip.write(duration: 47,
                          start_date: "2011-3-6 12:00",
                          start_station_name: "StartStation",
                          end_date: "2011-3-6 12:00",
                          end_station_name: "EndStation",
                          subscription_name: "Subscriber",
                          bike_id: 3,
                          zipcode: 80211)

      expect(Trip.least_ridden_bike).to eq(2)
      expect(Trip.trips_by_bike(Trip.least_ridden_bike)).to eq(1)
    end

    it "find the day with fewest rides" do
            Station.write(name: "StartStation", 
                    dock_count: 7,
                    city_name: "City",
                    installation_date: "2013-11-11")
      Station.write(name: "EndStation", 
                    dock_count: 7,
                    city_name: "City",
                    installation_date: "2013-11-11")
      trip1 = Trip.write(duration: 45,
                          start_date: "2011-3-6",
                          start_station_name: "StartStation",
                          end_date: "2011-3-6 12:00",
                          end_station_name: "EndStation",
                          bike_id: 2,
                          subscription_name: "Subscriber",
                          zipcode: 80211)
      trip2 = Trip.write(duration: 47,
                          start_date: "2011-3-7",
                          start_station_name: "StartStation",
                          end_date: "2011-3-6 12:00",
                          end_station_name: "EndStation",
                          subscription_name: "Subscriber",
                          bike_id: 3,
                          zipcode: 80211)
      trip3 = Trip.write(duration: 47,
                          start_date: "2011-3-6",
                          start_station_name: "StartStation",
                          end_date: "2011-3-6 12:00",
                          end_station_name: "EndStation",
                          subscription_name: "Subscriber",
                          bike_id: 3,
                          zipcode: 80211)

      expect(DateFormat.parse(Trip.day_with_lowest_number_of_trips)).to eq("Mon, 07 Mar 2011")
    end
  end

  it "find most frequent destination station" do
    test_start_station = Station.write(name: "TestStation1",
                                      lat: 1.1,
                                      long: 1.2,
                                      dock_count: 1,
                                      city_name: "TestCityName1",
                                      installation_date: "2011-11-11")
    test_end_station1 = Station.write(name: "TestStation3",
                                      lat: 3.1,
                                      long: 3.2,
                                      dock_count: 3,
                                      city_name: "TestCityName3",
                                      installation_date: "2011-11-11")
    test_end_station2 = Station.write(name: "TestStation2",
                                      lat: 3.1,
                                      long: 3.2,
                                      dock_count: 3,
                                      city_name: "TestCityName3",
                                      installation_date: "2011-11-11")
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
    test_trip3 = Trip.write(duration: 100,
                              start_date: "2012-2-2 12:00",
                              start_station_name: "TestStation3",
                              end_date: "2012-2-6 12:00",
                              end_station_name: "TestStation2",
                              bike_id: 6,
                              subscription_type: "Subscriber", 
                              zipcode: 80222)

    expect(Trip.most_frequent_destination_station.name).to eq("TestStation3")
  end

end