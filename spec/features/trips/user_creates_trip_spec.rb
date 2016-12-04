require_relative '../../spec_helper'

describe "when a user visits trips/new" do
  it "they can create a new trip" do
    visit "/trips/new"

    fill_in "trip[duration]", :with => 5
    fill_in "trip[start_station_id]", :with => 4
    fill_in "trip[end_station_id]", :with => 2738
    fill_in "trip[start_date]", :with => "11-7-1200 14:44"
    fill_in "trip[end_date]", :with => "11-7-2014 16:44"
    fill_in "trip[bike_id]", :with => 2
    fill_in "trip[subscription_type]", :with => "baller"
    fill_in "trip[zip_code]", :with => 90210

    click_on("Create Station")

    expect(current_path).to eql "/trips"
    expect(page).to have_content 2738
  end
end
