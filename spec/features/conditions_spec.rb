require_relative '../spec_helper'

describe "Condition feature test (Capybara)" do
  describe "Show list of conditions GET /conditions" do
    it "Page loads" do
      visit("/conditions")

      expect(page).to have_content("Daily Weather Details")
    end
    it "Page loads with correct content" do
      test_condition = Condition.write(date: "2011-01-01",
                                        max_temperature_f: 90,
                                        mean_temperature_f: 45,
                                        min_temperature_f: 0,
                                        mean_humidity: 50,
                                        mean_visibility_miles: 10,
                                        max_wind_speed_mph: 2,
                                        precipitation_inches: 0
                                        )
      visit("/conditions")

      expect(page).to have_content("Daily Weather Details")
      expect(page).to have_content(test_condition.max_temperature_f.to_s)
    end
  end
  describe "Show condition page:  GET /conditions/:id" do
    it "Page loads with correct content" do
      test_condition = Condition.write(date: "2011-01-01",
                      max_temperature_f: 90,
                      mean_temperature_f: 45,
                      min_temperature_f: 0,
                      mean_humidity: 50,
                      mean_visibility_miles: 10,
                      max_wind_speed_mph: 2,
                      precipitation_inches: 0
                      )
      visit("/conditions/1")

      expect(page).to have_content(test_condition.max_temperature_f)
    end
    it "Can navigate to EDIT page" do
      test_condition = Condition.write(date: "2011-01-01",
                      max_temperature_f: 90,
                      mean_temperature_f: 45,
                      min_temperature_f: 0,
                      mean_humidity: 50,
                      mean_visibility_miles: 10,
                      max_wind_speed_mph: 2,
                      precipitation_inches: 0
                      )
      visit("/conditions/#{test_condition.id}")

      click_on "Update"

      expect(page).to have_content("Edit")
      expect(current_path).to eq("/conditions/#{test_condition.id}/edit")
      expect(find_field('conditions[max_temperature_f]').value).to eq(test_condition.max_temperature_f.to_s)
    end
  end
  describe "Add new conditions: GET /conditions/new" do
    it "Page loads with correct content" do
      visit("/conditions/new")

      expect(page).to have_content("Add New Weather Details")
      expect(page).to have_selector("input", :id =>"conditions-date")
      expect(page).to have_selector("input", :id =>"conditions-max_temperature_f")
      expect(page).to have_selector("input", :id =>"conditions-mean_temperature_f")
      expect(page).to have_selector("input", :id =>"conditions-min_temperature_f")
      expect(page).to have_selector("input", :id =>"conditions-mean_humidity")
      expect(page).to have_selector("input", :id =>"conditions-mean_visibility_miles")
      expect(page).to have_selector("input", :id =>"conditions-max_wind_speed_mph")
      expect(page).to have_selector("input", :id =>"conditions-precipitation_inches")
      page.find_button('Submit')[:value]
    end
    it "Page can submit new data" do
      test_condition = Condition.write(date: "2011-01-01",
                      max_temperature_f: 90,
                      mean_temperature_f: 45,
                      min_temperature_f: 0,
                      mean_humidity: 50,
                      mean_visibility_miles: 10,
                      max_wind_speed_mph: 2,
                      precipitation_inches: 0
                      )
      visit("/conditions/new")

      fill_in "conditions[date]", with: test_condition.date
      fill_in "conditions[max_temperature_f]", with: test_condition.max_temperature_f
      fill_in "conditions[mean_temperature_f]", with: test_condition.mean_temperature_f
      fill_in "conditions[min_temperature_f]", with: test_condition.min_temperature_f
      fill_in "conditions[mean_humidity]", with: test_condition.mean_humidity
      fill_in "conditions[mean_visibility_miles]", with: test_condition.mean_visibility_miles
      fill_in "conditions[max_wind_speed_mph]", with: test_condition.max_wind_speed_mph
      fill_in "conditions[precipitation_inches]", with: test_condition.precipitation_inches

      click_on "Submit"

      expected_condition = Condition.find_by(max_temperature_f: test_condition.max_temperature_f)

      expect(current_path).to eq("/conditions/#{expected_condition.id}")
      expect(page).to have_content(test_condition.max_temperature_f.to_s)
    end
  end
  describe "Can edit condition details" do
    it "Page loads with condition details in entry fields" do
      test_condition = Condition.write(date: "2011-01-01",
                      max_temperature_f: 90,
                      mean_temperature_f: 45,
                      min_temperature_f: 0,
                      mean_humidity: 50,
                      mean_visibility_miles: 10,
                      max_wind_speed_mph: 2,
                      precipitation_inches: 0
                      )
      visit("/conditions/#{test_condition.id}/edit")

      expect(current_path).to eq("/conditions/#{test_condition.id}/edit")
      expect(find_field('conditions[date]').value).to eq(test_condition.date.to_s)
      expect(find_field('conditions[max_temperature_f]').value).to eq(test_condition.max_temperature_f.to_s)
      expect(find_field('conditions[mean_temperature_f]').value).to eq(test_condition.mean_temperature_f.to_s)
      expect(find_field('conditions[min_temperature_f]').value).to eq(test_condition.min_temperature_f.to_s)
      expect(find_field('conditions[mean_humidity]').value).to eq(test_condition.mean_humidity.to_s)
      expect(find_field('conditions[mean_visibility_miles]').value).to eq(test_condition.mean_visibility_miles.to_s)
      expect(find_field('conditions[max_wind_speed_mph]').value).to eq(test_condition.max_wind_speed_mph.to_s)
      expect(find_field('conditions[precipitation_inches]').value).to eq(test_condition.precipitation_inches.to_s)
    end
    it "We can save updated information" do
      test_condition = Condition.write(date: "2011-01-01",
                      max_temperature_f: 90,
                      mean_temperature_f: 45,
                      min_temperature_f: 0,
                      mean_humidity: 50,
                      mean_visibility_miles: 10,
                      max_wind_speed_mph: 2,
                      precipitation_inches: 0
                      )
      new_max_temperature_f = 999

      visit("/conditions/#{test_condition.id}/edit")

      fill_in "conditions[max_temperature_f]", with: new_max_temperature_f

      click_on "Update"

      new_condition = Condition.find(test_condition.id)

      expect(new_condition.max_temperature_f).to eq(new_max_temperature_f)
      expect(current_path).to eq("/conditions/#{test_condition.id}")
      expect(page).to have_content(new_max_temperature_f.to_s)
    end
  end
  describe "Can delete condition:  DELETE /conditions/:id" do
    it "Can delete condition" do
      test_condition = Condition.write(date: "2011-01-01",
                      max_temperature_f: 90,
                      mean_temperature_f: 45,
                      min_temperature_f: 0,
                      mean_humidity: 50,
                      mean_visibility_miles: 10,
                      max_wind_speed_mph: 2,
                      precipitation_inches: 0
                      )
      visit("/conditions/#{test_condition.id}")

      click_on "Delete"

      expect(current_path).to eq("/conditions")
      expect(Condition.count).to eq(0)
      expect(page).not_to have_content(test_condition.max_temperature_f.to_s)
    end

    describe "visit dashboard" do
      it "show day with highest number of rides" do
        Station.write(name: "TestStation3",
                    lat: 3.1,
                    long: 3.2,
                    dock_count: 3,
                    city_name: "TestCityName3",
                    installation_date: "2011-11-11")
        Trip.write(duration: 45,
                  start_date: "2013-12-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 23,
                  start_date: "2013-12-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 76,
                  start_date: "2013-10-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 23,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 7,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 70,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Condition.write(date: "2013-12-12",
                        max_temperature_f: 32,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.4)
        Condition.write(date: "2013-10-12",
                        max_temperature_f: 37,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.3)
        Condition.write(date: "2013-06-13",
                        max_temperature_f: 39,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.1)

        visit "/conditions-dashboard"
        
        expect(page).to have_content("Thu, 13 Jun 2013")
      end

      it "Show weather for day with Lowest Number of Rides" do
        Station.write(name: "TestStation3",
                    lat: 3.1,
                    long: 3.2,
                    dock_count: 3,
                    city_name: "TestCityName3",
                    installation_date: "2011-11-11")
        Trip.write(duration: 45,
                  start_date: "2013-12-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 23,
                  start_date: "2013-12-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 76,
                  start_date: "2013-10-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 23,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 7,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 70,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Condition.write(date: "2013-12-12",
                        max_temperature_f: 32,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.4)
        Condition.write(date: "2013-10-12",
                        max_temperature_f: 37,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.3)
        Condition.write(date: "2013-06-13",
                        max_temperature_f: 39,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.1)

        visit "/conditions-dashboard"
        expect(page).to have_content("Sat, 12 Oct 2013")
      end

      it "show temperatures broken into ranges by 10 degrees" do
      Station.write(name: "TestStation3",
                    lat: 3.1,
                    long: 3.2,
                    dock_count: 3,
                    city_name: "TestCityName3",
                    installation_date: "2011-11-11")
        Trip.write(duration: 45,
                  start_date: "2013-12-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 23,
                  start_date: "2013-12-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 76,
                  start_date: "2013-10-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 23,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 7,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 70,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Condition.write(date: "2013-12-12",
                        max_temperature_f: 32,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.4)
        Condition.write(date: "2013-10-12",
                        max_temperature_f: 37,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.3)
        Condition.write(date: "2013-06-13",
                        max_temperature_f: 39,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.1)
        visit "/conditions-dashboard"

        within('table:nth-of-type(1)') do
          within('tr:nth-of-type(2)') do
            within('td:nth-of-type(1)') do
              expect(page).to have_content("41-50")
            end
          end
        end
      end

      it "contain data on number of rides by temp" do
        Station.write(name: "TestStation3",
                    lat: 3.1,
                    long: 3.2,
                    dock_count: 3,
                    city_name: "TestCityName3",
                    installation_date: "2011-11-11")
        Trip.write(duration: 45,
                  start_date: "2013-12-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 23,
                  start_date: "2013-12-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 76,
                  start_date: "2013-10-12",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 23,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 7,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Trip.write(duration: 70,
                  start_date: "2013-06-13",
                  start_station_name: "TestStation3",
                  end_date: "2011-3-6",
                  end_station_name: "TestStation3",
                  bike_id: 3,
                  subscription_type: "Subscriber", 
                  zipcode: 80211)
        Condition.write(date: "2013-12-12",
                        max_temperature_f: 52,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.4)
        Condition.write(date: "2013-10-12",
                        max_temperature_f: 57,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.3)
        Condition.write(date: "2013-06-13",
                        max_temperature_f: 59,
                        mean_temperature_f: 20,
                        min_temperature_f: 20,
                        mean_humidity: 20,
                        mean_visibility_miles: 1,
                        max_wind_speed_mph: 23,
                        precipitation_inches: 0.1)
        visit('/conditions-dashboard')
        
        within('table:nth-of-type(1)') do
          within('tr:nth-of-type(3)') do
            within('td:nth-of-type(2)') do
              expect(page).to have_content("2.0")
            end
          end
        end

        within('table:nth-of-type(1)') do
          within('tr:nth-of-type(3)') do
            within('td:nth-of-type(3)') do
              expect(page).to have_content("3")
            end
          end
        end

        within('table:nth-of-type(1)') do
          within('tr:nth-of-type(3)') do
            within('td:nth-of-type(4)') do
              expect(page).to have_content("1")
            end
          end
        end
      end

      it "show precipitation_inches in .5 ranges" do
        Station.write(name: "TestStation3",
                      lat: 3.1,
                      long: 3.2,
                      dock_count: 3,
                      city_name: "TestCityName3",
                      installation_date: "2011-11-11")
          Trip.write(duration: 45,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 76,
                    start_date: "2013-10-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 7,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 70,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Condition.write(date: "2013-12-12",
                          max_temperature_f: 32,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.4)
          Condition.write(date: "2013-10-12",
                          max_temperature_f: 37,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.3)
          Condition.write(date: "2013-06-13",
                          max_temperature_f: 39,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.1)
          visit "/conditions-dashboard"

          within('table:nth-of-type(2)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(1)') do
                expect(page).to have_content("0-0.5")
              end
            end
          end
      end

      it "show data for number of rides by precipitation_inches" do
        Station.write(name: "TestStation3",
                      lat: 3.1,
                      long: 3.2,
                      dock_count: 3,
                      city_name: "TestCityName3",
                      installation_date: "2011-11-11")
          Trip.write(duration: 45,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 76,
                    start_date: "2013-10-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 7,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 70,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Condition.write(date: "2013-12-12",
                          max_temperature_f: 32,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.4)
          Condition.write(date: "2013-10-12",
                          max_temperature_f: 37,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.3)
          Condition.write(date: "2013-06-13",
                          max_temperature_f: 39,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.1)
          visit "/conditions-dashboard"

          within('table:nth-of-type(2)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(2)') do
                expect(page).to have_content("2.0")
              end
            end
          end

          within('table:nth-of-type(2)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(3)') do
                expect(page).to have_content("3")
              end
            end
          end
          
          within('table:nth-of-type(2)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(4)') do
                expect(page).to have_content("1")
              end
            end
          end
      end

      it "show wind speed in 4 mph ranges" do
        Station.write(name: "TestStation3",
                      lat: 3.1,
                      long: 3.2,
                      dock_count: 3,
                      city_name: "TestCityName3",
                      installation_date: "2011-11-11")
          Trip.write(duration: 45,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 76,
                    start_date: "2013-10-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 7,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 70,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Condition.write(date: "2013-12-12",
                          max_temperature_f: 32,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.4)
          Condition.write(date: "2013-10-12",
                          max_temperature_f: 37,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.3)
          Condition.write(date: "2013-06-13",
                          max_temperature_f: 39,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.1)
          visit "/conditions-dashboard"

          within('table:nth-of-type(3)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(1)') do
                expect(page).to have_content("0-4")
              end
            end
          end
      end

      it "show data for number of rides by mean_wind_speed_mph" do
        Station.write(name: "TestStation3",
                      lat: 3.1,
                      long: 3.2,
                      dock_count: 3,
                      city_name: "TestCityName3",
                      installation_date: "2011-11-11")
          Trip.write(duration: 45,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 76,
                    start_date: "2013-10-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 7,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 70,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Condition.write(date: "2013-12-12",
                          max_temperature_f: 52,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 3,
                          max_wind_speed_mph: 23,
                          mean_wind_speed_mph: 2,
                          precipitation_inches: 0.4)
          Condition.write(date: "2013-10-12",
                          max_temperature_f: 57,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          mean_wind_speed_mph: 1,
                          precipitation_inches: 0.3)
          Condition.write(date: "2013-06-13",
                          max_temperature_f: 59,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 4,
                          max_wind_speed_mph: 23,
                          mean_wind_speed_mph: 3,
                          precipitation_inches: 0.1)
          visit "/conditions-dashboard"
          
          within('table:nth-of-type(3)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(2)') do
                expect(page).to have_content("2.0")
              end
            end
          end

          within('table:nth-of-type(3)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(3)') do
                expect(page).to have_content("3")
              end
            end
          end
          
          within('table:nth-of-type(3)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(4)') do
                expect(page).to have_content("1")
              end
            end
          end
      end

      it "show visibility in 4 mi ranges" do
          Station.write(name: "TestStation3",
                      lat: 3.1,
                      long: 3.2,
                      dock_count: 3,
                      city_name: "TestCityName3",
                      installation_date: "2011-11-11")
          Trip.write(duration: 45,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 76,
                    start_date: "2013-10-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 7,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 70,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Condition.write(date: "2013-12-12",
                          max_temperature_f: 32,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.4)
          Condition.write(date: "2013-10-12",
                          max_temperature_f: 37,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.3)
          Condition.write(date: "2013-06-13",
                          max_temperature_f: 39,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.1)
          visit "/conditions-dashboard"

          within('table:nth-of-type(3)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(1)') do
                expect(page).to have_content("0-4")
              end
            end
          end
      end

      it "show data for number of rides by mean_visibility_miles" do
        Station.write(name: "TestStation3",
                      lat: 3.1,
                      long: 3.2,
                      dock_count: 3,
                      city_name: "TestCityName3",
                      installation_date: "2011-11-11")
          Trip.write(duration: 45,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-12-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 76,
                    start_date: "2013-10-12",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 23,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 7,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Trip.write(duration: 70,
                    start_date: "2013-06-13",
                    start_station_name: "TestStation3",
                    end_date: "2011-3-6",
                    end_station_name: "TestStation3",
                    bike_id: 3,
                    subscription_type: "Subscriber", 
                    zipcode: 80211)
          Condition.write(date: "2013-12-12",
                          max_temperature_f: 32,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.4)
          Condition.write(date: "2013-10-12",
                          max_temperature_f: 37,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.3)
          Condition.write(date: "2013-06-13",
                          max_temperature_f: 39,
                          mean_temperature_f: 20,
                          min_temperature_f: 20,
                          mean_humidity: 20,
                          mean_visibility_miles: 1,
                          max_wind_speed_mph: 23,
                          precipitation_inches: 0.1)
          visit "/conditions-dashboard"

          within('table:nth-of-type(4)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(2)') do
                expect(page).to have_content("2.0")
              end
            end
          end

          within('table:nth-of-type(4)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(3)') do
                expect(page).to have_content("3")
              end
            end
          end
          
          within('table:nth-of-type(4)') do
            within('tr:nth-of-type(2)') do
              within('td:nth-of-type(4)') do
                expect(page).to have_content("1")
              end
            end
          end
      end

    end
  end

end