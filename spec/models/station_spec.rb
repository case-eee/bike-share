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
  end
end