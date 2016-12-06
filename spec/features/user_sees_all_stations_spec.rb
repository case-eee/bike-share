require_relative '../spec_helper'

  describe "When a user visits '/stations'" do
    it "they see all the stations" do
      visit('/stations')

      expect(page).to have_content("All Stations")
    end
  end

  describe "When a user visits the new stations path" do
    it "they can create a new station" do
      visit '/stations/new'

      fill_in 'stations[name]', with: "StationTest1"
      fill_in 'stations[dock_count]', with: 1
      fill_in 'stations[city_id]', with: "San Francisco"
      fill_in 'stations[installation_date]', with: "2011-11-11"
      click_on 'Submit'

      station1 = Station.find_by(name: "StationTest1")
      expect(page).to have_content("StationTest1")
      expect(current_path).to eq("/stations/#{ station1.id }")
    end
  end

  describe "When a user visits a stations id path" do
    it "they can see the station page" do

      station1 = Station.write(name: "StationTest1", dock_count: 1, city_name: "San Diego", installation_date: "2011-11-11")
      visit "/stations/#{ station1.id }"

      expect(page).to have_content(station1.name)
    end
  end

  describe "When a user visits an id edit path" do
    it "they can see the edit page" do

      station1 = Station.write(name: "StationTest1", dock_count: 1, city_name: "San Diego", installation_date: "2011-11-11")
      visit "/stations/1/edit"

      expect(current_path).to eq("/stations/1/edit")
      expect(find_field('stations[name]').value).to eq(station1.name)
    end
  end

  describe "When a user edits an id path" do
    it "will save the new information" do

      station1 = Station.write(name: "StationTest1", dock_count: 1, city_name: "San Diego", installation_date: "2011-11-11")
      visit "/stations/1/edit"

      expect(find_field('stations[name]').value).to eq("StationTest1")
      fill_in 'stations[name]', with: "StationTest2"
      expect(find_field('stations[name]').value).to eq("StationTest2")
    end
  end

  describe "When a user deletes an id path" do
    it "will delete the station object" do

      station1 = Station.write(name: "StationTest1", dock_count: 1, city_name: "San Diego", installation_date: "2011-11-11")
      visit "/stations/1"

      click_on 'Delete'
      save_and_open_page

      expect(page).not_to have_content("StationTest1")
      expect(current_path).to eq("/stations")

    end
  end
