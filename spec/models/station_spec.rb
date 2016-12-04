require_relative '../spec_helper'

describe 'Station' do

  before do
    City.create(name: "Denver")
  end
  
  describe 'validates' do
    it 'presence of station name' do
      invalid_station = City.first.stations.create(dock_count: 27, installation_date: "10/6/2015")
      expect(invalid_station).to be_invalid  
    end 

    it 'presence of the dock count' do
      invalid_station = City.first.stations.create(name: "I Like Bike", installation_date: "10/6/2015")
      expect(invalid_station).to be_invalid
    end

    it 'presence of a city_id' do
      invalid_station = Station.create(name: "I Like Bike", dock_count: 27, installation_date: "10/6/2015")
      expect(invalid_station).to be_invalid
    end
  end
end
