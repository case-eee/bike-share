require_relative '../spec_helper'

# describe "When a user visits '/stations'" do
#   it "they see all the stations" do
#     visit('/stations')
#
#     expect(page).to have_content(#{})
#   end

  describe "When a user visits 'stations/:id'" do
    it "they can find a specific station by id" do
      visit '/stations/2'
      expect(page).to have_content("San Jose Diridon Caltrain Station")
  end

  describe "When a user visits a new station path" do
    it "they can create a new station" do
      visit 'stations/new'
      fill_in "stations[name]",  with: "StationTest1"
      save_and_open_page
      click_on "Submit"


      test1 = Station.find_by(name: "StationTest1")
      expect(current_path).to eq("stations/#{stationtest1.id}")
      expect(page).to have_content("StationTest1")
    end
end
