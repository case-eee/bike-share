require_relative '../../spec_helper'

describe "when a user visits /stations" do
  it "they see stations header" do
    visit "/stations"

    within "h1:nth-of-type(1)" do
      expect(page).to have_content "All Stations"
    end
  end

  it "they can click on a create station button" do
    visit "/stations"

    click_on "Create"
    expect(page).to have_current_path "/stations/new"
  end

  it "they can delete an existing station" do
    Station.create(name:"hi35",dock_count:23,city_id:2,installation_date:'1999-23-23')
    visit "/stations"

    expect(page).to have_content "hi35"
    click_on "Delete Station : hi35"

    expect(page).to have_current_path "/stations"
    expect(page).not_to have_content "hi35"
  end

  it "they can update an existing station" do
    station = Station.create(name:"hi35",dock_count:23,city_id:2,installation_date:'1999-23-23')
    visit "/stations"

    expect(page).to have_content "hi35"
    click_on "Edit Station : hi35"

    expect(page).to have_current_path "/stations/#{station.id}/edit"
    fill_in "station[name]", :with => "Dock_1"
    fill_in "station[dock_count]", :with => 1
    fill_in "station[city_id]", :with => 1
    fill_in "station[installation_date]", :with => "1000-23-19"
    click_on "Update Station"
    expect(page).to have_content "Dock_1"
    expect(page).to have_current_path "/stations"
  end

  it "they can see an individual station" do
    station = Station.create(name:"hi35",dock_count:23,city_id:2,installation_date:'1999-23-23')
    visit "/stations"

    expect(page).to have_content "hi35"
    click_on "See Station : hi35"
    expect(page).to have_content "hi35"
    expect(page).to have_current_path "/stations/#{station.id}"

  end


end
