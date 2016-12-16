require_relative '../../spec_helper'

describe "When a user visits '/stations'" do
  it "they can view all stations" do
    Station.create(id: 1, name: "Station 1", dock_count: 5, city: "Denver", installation_date: "12/2/2016")
    Station.create(id: 2, name: "Station 2", dock_count: 5, city: "Denver", installation_date: "12/2/2016")
    Station.create(id: 3, name: "Station 3", dock_count: 5, city: "Denver", installation_date: "12/2/2016")

    visit '/stations'

    expect(page).to have_content("Station 1")
    expect(page).to have_content("Station 2")
    expect(page).to have_content("Station 3")
  end
end
