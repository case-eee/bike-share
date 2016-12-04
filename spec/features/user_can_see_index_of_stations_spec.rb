require_relative '../spec_helper'

describe 'Stations New Page' do

  before do
    City.create(name: "Denver")
    City.create(name: "Fort Collins")
    @station1 = City.first.stations.create(name: "Denver Union Station", dock_count: 7, installation_date: "12/2/2013")
    @station2 = City.last.stations.create(name: "Fort Collins Harmony", dock_count: 9, city_id: 2, installation_date: "8/10/2013")
    visit('/stations')
  end

  describe "When a user visits '/stations'" do
    it "they see an all stations heading" do
      within '.all-stations' do
        expect(page).to have_text "All Stations"
      end
    end

    it "they see a station's information" do
      within 'div.station-summary:nth-of-type(1) > ul > li:nth-of-type(1)' do
        expect(page).to have_content "Denver Union Station"
      end

      within 'div.station-summary:nth-of-type(1) > ul > li:nth-of-type(2)' do
        expect(page).to have_content 7
      end

      within 'div.station-summary:nth-of-type(1) > ul > li:nth-of-type(3)' do
        expect(page).to have_content "Denver"
      end

      within 'div.station-summary:nth-of-type(1) > ul > li:nth-of-type(4)' do
        expect(page).to have_content "2013-02-12"
      end

      within 'div.station-summary:nth-of-type(1) > form:nth-of-type(1)' do
        expect(page).to have_button "Edit"
      end

      within 'div.station-summary:nth-of-type(1) > form:nth-of-type(2)' do
        expect(page).to have_button "Delete"
      end

    end
  end

  describe 'when they click edit' do
    it 'they are taken to the edit page' do
      within 'div.station-summary:nth-of-type(1)' do
        click_on "Edit"
        expect(current_path).to eq("/stations/#{@station1.id}/edit")
      end
    end
  end

  describe 'when they click delete' do
    it 'they are taken to the index page' do
      within 'div.station-summary:nth-of-type(2)' do
        click_on "Delete"
        expect(current_path).to eq("/stations")
        expect(page.body).not_to include("Fort Collins")
      end
    end
  end
end