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
  describe "Iteration3 methods" do
    it "It returns correct value when table has 1 station" do
      test_station1 = Station.write(name: "TestStation1",
                                    lat: 1.1,
                                    long: 1.2,
                                    dock_count: 1,
                                    city_name: "TestCityName1",
                                    installation_date: "2011-11-11"
                                    )

      expect(Station.most_bikes).to eq(test_station1.dock_count)
    end
    it "It returns correct value when table has more than stations" do
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
end