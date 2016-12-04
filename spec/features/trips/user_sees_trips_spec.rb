require_relative '../../spec_helper'

describe "when a user visits /trips" do
  it "they see trips header" do
    visit "/trips"

    expect(page).to have_content "All Trips"
  end

  it "they see the trips organized by date" do
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
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-2014 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 45554, start_date: "11-5-1960 14:44", end_date: "11-5-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 13233, start_date: "11-3-1957 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    Trip.create(duration: 67, start_station_id: 14242, end_station_id: 67776, start_date: "01-8-1950 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    visit "/trips"
    # save_and_open_page
    expect(page).to have_content(89998)
    expect(page).to have_content(45554)
    expect(page).to have_content(13233)
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
    Trip.create(duration: 67, start_station_id: 32222, end_station_id: 67776, start_date: "01-8-1950 14:44", end_date: "11-3-2014 14:55", bike_id: 23, subscription_type: "Subcriber", zip_code: 1029)
    visit "/trips"

    expect(page).to have_content 33333
    first('form:nth-of-type(2)').click_on "Delete Trip"

    expect(page).to have_current_path "/trips"
    expect(page).not_to have_content 33333
  end
end
