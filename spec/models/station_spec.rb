require_relative '../spec_helper'

describe "Station" do
  describe ".total_stations" do
    it "returns the total number of stations" do
      Station.create(name:"hi35",dock_count:23,city_id:2,installation_date:'1999-23-23')
      Station.create(name:"david",dock_count:28,city_id:3,installation_date:'1999-23-24')

      expect(Station.total_stations).to eql(2)
    end
  end

  describe ".average_bikes_per_station" do
    it "returns the average number of bikes per station" do
      Station.create(name:"hi35",dock_count:20,city_id:2,installation_date:'1999-23-23')
      Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-23-24')

      expect(Station.average_bikes_per_station).to eql(25)
    end
  end

  describe ".max_bikes" do
    it "returns max number of biks at any station" do
      Station.create(name:"hi35",dock_count:20,city_id:2,installation_date:'1999-23-23')
      Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-23-24')

      expect(Station.max_bikes).to eql(30)
    end
  end

  describe ".station_with_max_bikes" do
    it "returns the station with the most bikes" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-23-23')
      david = Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-23-24')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'1999-23-24')

      expect(Station.station_with_max_bikes.first.id).to eql(2)
      expect(Station.station_with_max_bikes.count).to eql(2)
    end
  end

  describe ".min_bikes" do
    it "returns min number of biks at any station" do
      Station.create(name:"hi35",dock_count:20,city_id:2,installation_date:'1999-23-23')
      Station.create(name:"david",dock_count:30,city_id:3,installation_date:'1999-23-24')

      expect(Station.min_bikes).to eql(20)
    end
  end

  describe ".station_with_min_bikes" do
    it "returns the station with the most bikes" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1999-23-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1999-23-24')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'1999-23-24')

      expect(Station.station_with_min_bikes.first.id).to eql(1)
      expect(Station.station_with_min_bikes.count).to eql(2)
    end
  end

  describe ".newest" do
    it "returns the most recently installed station" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'2016-5-24')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')

      expect(Station.newest.first.id).to eql(2)
      expect(Station.newest.count).to eql(2)
    end
  end

  describe ".oldest" do
    it "returns the most recently installed station" do
      eric = Station.create(name:"eric",dock_count:20,city_id:2,installation_date:'1990-5-23')
      david = Station.create(name:"david",dock_count:20,city_id:3,installation_date:'1990-5-23')
      nick = Station.create(name:"nick",dock_count:30,city_id:4,installation_date:'2016-5-24')

      expect(Station.oldest.first.id).to eql(1)
      expect(Station.oldest.count).to eql(2)
    end
  end






end
