require_relative '../spec_helper'

describe "Condition feature test" do
  describe "Show list of conditions GET /conditions" do
    it "Page loads" do
      visit("/conditions")

      expect(page).to have_content("Daily weather list")
    end
    it "Page loads with correct content" do
      Condition.write(date: "2011-01-01",
                      max_temperature_f: 90,
                      mean_temperature_f: 45,
                      min_temperature_f: 0,
                      mean_humidity: 50,
                      mean_visibility_miles: 10,
                      max_wind_speed_mph: 2,
                      precipitation_inches: 0
                      )
      visit("/conditions")

      expect(page).to have_content("Daily weather list")
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
  end
  describe "Add new conditions: GET /conditions/new" do
    it "Page loads with correct content" do
      visit("/conditions/new")

      expect(page).to have_content("Add new weather condition")
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

      expect(page).to have_content("90")
      save_and_open_page
      expect(current_path).to eq("/conditions/#{expected_condition.id}")

    end
  end

end