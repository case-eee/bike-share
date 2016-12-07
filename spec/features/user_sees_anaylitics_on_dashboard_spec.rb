require_relative "../spec_helper"

describe "Dashboard Features" do

  describe "When user accesses dashboard page" do
    it "they see the total count of stations" do
      Station.write(name: "TestStation1",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 1,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )
      visit "/stations-dashboard"

      expect(page).to have_content("Total count of stations: 1")
    end

    it "they see the average bikes available per stations" do
      Station.write(name: "TestStation1",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 2,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )
      Station.write(name: "TestStation2",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 3,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )
      visit "/stations-dashboard"
      
      expect(page).to have_content("Average bikes avaiable per station: 2.5")
    end

    it "they see the most bikes available at a station" do
      Station.write(name: "TestStation1",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 2,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )
      Station.write(name: "TestStation2",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 3,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )
      visit "/stations-dashboard"

      expect(page).to have_content("TestStation2: 3")      
    end

    it "they see the stations where most bikes are available" do
      Station.write(name: "TestStation1",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 2,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )
      Station.write(name: "TestStation2",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 3,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )
      visit "/stations-dashboard"
      
      expect(page).to have_content("Stations where the most bikes are available: 3")
    end

    it "they see stations where fewest bikes available" do
      Station.write(name: "TestStation1",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 2,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )
      Station.write(name: "TestStation2",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 3,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )
      visit "/stations-dashboard"

      expect(page).to have_content("TestStation1: 2")
    end

    it "they see the most recently installed station" do
      Station.write(name: "TestStation1",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 2,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )
      Station.write(name: "TestStation2",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 3,
                    city_name: "TestCityName1",
                    installation_date: "2013-11-11"
                    )
      visit "/stations-dashboard"

      expect(page).to have_content("Most recently installed station: TestStation2")
    end

    it "they see the oldest station" do
      Station.write(name: "TestStation1",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 2,
                    city_name: "TestCityName1",
                    installation_date: "2011-11-11"
                    )
      Station.write(name: "TestStation2",
                    lat: 1.1,
                    long: 1.2,
                    dock_count: 3,
                    city_name: "TestCityName1",
                    installation_date: "2013-11-11"
                    )
      visit "/stations-dashboard"
      
      expect(page).to have_content("Oldest station: TestStation1")
    end
  end

end