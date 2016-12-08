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
  end

end