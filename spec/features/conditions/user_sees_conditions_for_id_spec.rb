require_relative '../../spec_helper'

describe "Conditions/id" do
  describe "when a user visits /conditions/id" do
    it "they see a welcome message with the date" do
      condition = Condition.create(date: '12/01/2000', precipitation_inches: 5,
                                   max_temperature_f: 50, min_temperature_f: 20,
                                   mean_temperature_f: 35, mean_visibility_miles: 10,
                                   mean_wind_speed_mph: 20, mean_humidity: 20,
                                   zip_code: 94107)
      visit('/conditions/1')

      within("h1") do
        expect(page).to have_content("Conditions for #{condition.date}")
      end
    end
  end
end
