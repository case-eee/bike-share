class Station < ActiveRecord::Base
  belongs_to :city
  validates :name, :dock_count, :city_id, :installation_date, presence: true

  def self.write(station_details)
    self.find_or_create_by(name: station_details[:name],
                          lat: station_details[:lat],
                          long: station_details[:long],
                          dock_count: station_details[:dock_count],
                          city_id: find_city_id(station_details[:city_name]),
                          installation_date: station_details[:installation_date]
                          )
  end

  def self.find_city_id(city_name)
    City.write(name: city_name).id
  end

  def self.find_fewest_bikes
    Station.all.map do |station|
      station.dock_count
    end.sort.first
  end

  def self.find_by_fewest_bikes
    fewest_bikes = Station.find_fewest_bikes
    Station.all.where(dock_count: fewest_bikes)
  end

  def self.oldest_station
    order(:installation_date).first
  end

  def self.most_recently_installed_station
    order(:installation_date).last
  end

  def self.average_bikes_per_station
    average(:dock_count)
  end

  def self.most_bikes
    maximum("dock_count")
  end

  def self.find_by_most_bikes
    return [] if most_bikes.nil?
    where("dock_count = #{most_bikes}")
  end

end
