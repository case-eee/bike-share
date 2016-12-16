require_relative '../../spec_helper'

describe 'When a user visits /conditions/new' do
  it 'they can create a new set of conditions' do
    visit '/conditions/new'

    within "h1" do
      expect(page).to have_content("Create New Conditions")
    end
    condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                 max_temperature_f: 50, min_temperature_f: 20,
                                 mean_temperature_f: 35, mean_visibility_miles: 10,
                                 mean_wind_speed_mph: 20, mean_humidity: 20,
                                 zip_code: 94107)


    fill_in "condition[date]", with: "2015-08-31"
    fill_in "condition[max_temperature_f]", with: 50
    fill_in "condition[mean_temperature_f]", with: 40
    fill_in "condition[min_temperature_f]", with: 30
    fill_in "condition[mean_humidity]", with: 20
    fill_in "condition[mean_visibility_miles]", with: 10
    fill_in "condition[mean_wind_speed_mph]", with: 12
    fill_in "condition[precipitation_inches]", with: 0

    click_on "Create Conditions!"

    condition = Condition.find_by(date: "2015-08-31")

    expect(condition).to be_valid

    expect(current_path).to eq("/conditions/#{condition.id}")

    expect(page).to have_content("Conditions for 2015-08-31")
  end
end
