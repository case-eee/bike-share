require_relative '../../spec_helper'

describe "Conditions/id/edit" do
  describe "when a user visits /conditions/id/edit" do
    it "they are able to update an existing conditon record" do
      condition = Condition.create(date: '2000-01-01', precipitation_inches: 5,
                                   max_temperature_f: 50, min_temperature_f: 20,
                                   mean_temperature_f: 35, mean_visibility_miles: 10,
                                   mean_wind_speed_mph: 20, mean_humidity: 20)
      visit("/conditions/#{condition.id}/edit")

      within("h1") do
        expect(page).to have_content("Editing Conditions from #{condition.date}")
      end

      fill_in "condition[date]", with: "2000-11-30"
      click_on "Edit Conditions"

      expect(current_path).to eq("/conditions/#{condition.id}")

      within("h1") do
        expect(page).to have_content("Conditions for 2000-11-30")
      end
    end
  end
end
