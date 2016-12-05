require_relative '../spec_helper'

describe "Trip" do 
  describe "Validates" do
    it "presence of duration" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  end_station_id: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  end_date: "11-3-2014 14:55", 
                                  bike_id: 23, 
                                  subscription_type: "Subcriber", 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of start_station_id" do
      invalid_trip = Trip.create( duration: 14242, 
                                  end_station_id: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  end_date: "11-3-2014 14:55", 
                                  bike_id: 23, 
                                  subscription_type: "Subcriber", 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of end_station_id" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  duration: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  end_date: "11-3-2014 14:55", 
                                  bike_id: 23, 
                                  subscription_type: "Subcriber", 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of start_date" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  end_station_id: 13233, 
                                  duration: 4, 
                                  end_date: "11-3-2014 14:55", 
                                  bike_id: 23, 
                                  subscription_type: "Subcriber", 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of end_date" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  end_station_id: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  duration: 44, 
                                  bike_id: 23, 
                                  subscription_type: "Subcriber", 
                                  zip_code: 1029)

      expect(invalid_trip).to_not be_valid
    end

    it "presence of bike_id" do
      invalid_trip = Trip.create( start_station_id: 14242, 
                                  end_station_id: 13233, 
                                  start_date: "11-3-2014 14:44", 
                                  end_date: "11-3-2014 14:55", 
                                  duration: 23, 
                                  subscription_type: "Subcriber", 
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
                                  subscription_type: "Subcriber", 
                                  duration: 1029)

      expect(invalid_trip).to_not be_valid
    end
  end
end