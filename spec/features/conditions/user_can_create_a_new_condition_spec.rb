require_relative '../../spec_helper'

describe 'When a user visits /conditions/new' do
  it 'they can create a new set of conditions' do
    visit '/conditions/new'

    within "h1" do
      expect(page).to have_content("Create New Conditions")
    end

    fill_in "condition[date]", with: "12/25/2016"
    fill_in "condition[max_temperature_f]", with: 50
    fill_in "condition[mean_temperature_f]", with: 40
    fill_in "condition[min_temperature_f]", with: 30
    fill_in "condition[mean_humidity]", with: 20
    fill_in "condition[mean_visibility]", with: 10
    fill_in "condition[mean_wind_speed_mph]", with: 12
    fill_in "condition[precipitation_inches]", with: 0

    click_on "Create Conditions!"

    condition = Condition.find_by(date: "12/25/2016")

    expect(condition).to be_valid

    expect(current_path).to eq("/conditions/#{condition.id}")
    expect(page).to have_content("Conditions for 12/25/2016")
  end
end
