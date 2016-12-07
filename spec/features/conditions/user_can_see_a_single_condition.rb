require_relative "../../spec_helper"

describe "When a user wants to display data from a single station," do
    
  before do  
    City.create(name: "Denver")
    @station1 = City.first.stations.create(name: "I Like Bike", dock_count: 27, installation_date: "2015/10/16", lat: 37.330698, long: -121.888979)
    visit "/stations/#{Station.first.id}"
  end

  it "they see the station's information," do
    expect(page).to have_content("I Like Bike")
    expect(page).to have_content("Denver")
    expect(page).to have_content(27)
    expect(page).to have_content(37.330698)
    expect(page).to have_content(-121.888979)
    # save_and_open_page
    expect(page).to have_content("Established: 2015-10-16")
  end

  describe 'when they click edit' do
    it 'they are taken to the edit page' do
      click_on "Edit"
      expect(current_path).to eq("/stations/#{@station1.id}/edit")
    end
  end

  describe 'when they click delete' do
    it 'they are taken to the index page' do
      expect(page.body).to include("Denver")
      click_on "Delete"
      expect(current_path).to eq("/stations")
      expect(page.body).not_to include("Denver")
    end
  end
end


