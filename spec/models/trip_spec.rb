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

  # describe ".number_of_rides_by_month" do
  #   it "returns month by month breakdown of number of rides with subtotals of each year" do
  #     Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date_time: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
  #     Trip.create(duration: 20, start_station_id: 2, end_station_id: 2, start_date_time: "1-3-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
  #     Trip.create(duration: 40, start_station_id: 3, end_station_id: 3, start_date_time: "6-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
  #     Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date_time: "12-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)
  #     Trip.create(duration: 67, start_station_id: 1, end_station_id: 1, start_date_time: "12-3-2013 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subscriber", zip_code: 1029)

  #     expect(Trip.number_of_rides_by_month(2014).count).to eql(4)
  #     expect(Trip.number_of_rides_by_month(2014).last).to eql(1)
  #     expect(Trip.number_of_rides_by_month(2014)[1]).to eql(2)

  #   end
  # end

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



end

