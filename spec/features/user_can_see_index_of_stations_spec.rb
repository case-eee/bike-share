require_relative '../spec_helper'

describe 'When a user visists /stations' do

  before do
    City.create(name: "Denver")
    City.create(name: "Fort Collins")
    @station1 = City.first.stations.create(name: "Denver Union Station", dock_count: 7, installation_date: "2013/12/02", lat: 37.330698, long: -121.888979)
    @station2 = City.last.stations.create(name: "Fort Collins Harmony", dock_count: 9, city_id: 2, installation_date: "2013/8/10", lat: 39.330698, long: -120.888979)
    visit('/stations')
  end

  it 'there are map markers on the page' do
    expect(page).to have_content "addMarker"
  end
    

  describe "they can see" do
    it "an all stations heading" do
      within '.all-stations' do
        expect(page).to have_text "All Stations"
      end
    end

    it "a station's information" do
      expect(page).to have_button "New"
      within 'div.station-summary:nth-of-type(1)' do
        expect(page).to have_content "Denver Union Station"
        expect(page).to have_content 7
        expect(page).to have_content "Denver"
        expect(page).to have_content 37.330698
        expect(page).to have_content -121.888979
        expect(page).to have_content "2013-12-02"
      end
    end

    it "new, edit, and delete buttons" do 
      expect(page).to have_button "New"
      within 'div.station-summary:nth-of-type(1)' do
        expect(page).to have_button "Edit"
        expect(page).to have_button "Delete"
      end        
    end

    it "and a different station's information" do
      within 'div.station-summary:nth-of-type(2)' do
        expect(page).to have_content "Fort Collins Harmony"
        expect(page).to have_content 9
        expect(page).to have_content "Fort Collins"
        expect(page).to have_content 39.330698
        expect(page).to have_content -120.888979
        expect(page).to have_content "2013-08-10"
      end
    end
  end

  describe 'and when they click new' do
    it 'they are taken to the new page' do
      click_on "New"
      expect(current_path).to eq("/stations/new")
    end
  end

  describe 'and when they click edit' do
    it 'they are taken to the edit page' do
      within 'div.station-summary:nth-of-type(1)' do
        click_on "Edit"
        expect(current_path).to eq("/stations/#{@station1.id}/edit")
      end
    end
  end

  describe 'and when they click delete' do
    it 'they are taken to the index page' do
      within 'div.station-summary:nth-of-type(2)' do
        expect(page.body).to include("Fort Collins")
        click_on "Delete"
        expect(current_path).to eq("/stations")
        expect(page.body).not_to include("Fort Collins")
      end
    end
  end

end