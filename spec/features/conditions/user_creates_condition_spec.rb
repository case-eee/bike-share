require_relative '../../spec_helper'

describe "when a user visits conditions/new" do
  xit "they can create a new condition" do
    visit "/conditions/new"

    fill_in "condition[date]", :with => "8/29/2013"
    fill_in "condition[max_temperature_f]", :with => 74.0
    fill_in "condition[mean_temperature_f]", :with => 68.0
    fill_in "condition[min_temperature_f]", :with => 61.0
    fill_in "condition[mean_humidity]", :with =>  75.0
    fill_in "condition[mean_visibility_miles]", :with => 10.0
    fill_in "condition[max_wind_speed_mph]", :with => 23.0
    fill_in "condition[precipitation_inches]", :with => 0

    click_on("Create Condition")

    expect(current_path).to eql "/conditions"
    expect(page).to have_content 74.0
  end
end
