require_relative '../../spec_helper'

describe "when a user visits /trips" do
  it "they see trips header" do
    visit "/trips"

    expect(page).to have_content "All Trips"
  end

  it "they see the 30 per page trips organized by date" do
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2012 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 89998, start_date: "11-3-2015 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-9-2014 14:44", end_date: "11-9-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-4-2014 14:44", end_date: "11-4-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-2-2014 14:44", end_date: "11-2-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-7-2013 14:44", end_date: "11-7-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-1-2014 14:44", end_date: "11-1-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-2-2000 14:44", end_date: "11-2-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-7-2014 14:44", end_date: "11-7-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-2-2014 14:44", end_date: "11-2-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 12222, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 45554, start_date: "11-5-1960 14:44", end_date: "11-5-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-1957 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 67776, start_date: "01-8-1950 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    visit "/trips"
    expect(page).to have_content(89998)
    expect(page).to have_content(12222)
    expect(page).not_to have_content(45554)

  end

  it "they can click on a create trip button" do
    visit "/trips"

    click_on "Create"
    expect(page).to have_current_path "/trips/new"
  end

  it "they can see an individual trip" do
    trip = Trip.create(duration: 67, start_station_id: 33333, end_station_id: 67776, start_date: "01-8-1950 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    visit "/trips"

    expect(page).to have_content 33333
    find("a[href='/trips/#{trip.id}']").click
    expect(page).to have_content 33333
    expect(page).to have_current_path "/trips/#{trip.id}"
  end

  it "they can delete an existing trip" do
    Trip.create(duration: 67, start_station_id: 33333, end_station_id: 67776, start_date: "01-8-1950 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    visit "/trips"

    expect(page).to have_content 33333
    within(".delete_trip") do
      click_on "Delete"
    end

    expect(page).to have_current_path "/trips"
    expect(page).not_to have_content 33333
  end

  it "they can update an existing trip" do
    trip = Trip.create(duration: 67, start_station_id: 32222, end_station_id: 67776, start_date: "01-8-1950 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    visit "/trips"

    expect(page).to have_content 67776
    find("a[href='/trips/#{trip.id}/edit']").click

    expect(page).to have_current_path "/trips/#{trip.id}/edit"
    fill_in "trip[duration]", :with => 5
    fill_in "trip[start_station_id]", :with => 4
    fill_in "trip[end_station_id]", :with => 2738
    fill_in "trip[start_date]", :with => "11-7-1200 14:44"
    fill_in "trip[end_date]", :with => "11-7-2014 16:44"
    fill_in "trip[bike_id]", :with => 2
    fill_in "trip[subscription_type]", :with => "baller"
    fill_in "trip[zip_code]", :with => 90210
    click_on "Update Trip"
    expect(page).to have_content 2738
    expect(page).to have_current_path "/trips"
  end

end
