class Station < ActiveRecord::Base

  validates :name, :dock_count, :city_id, :installation_date, presence: true

  def self.write(station_details)
    puts station_details[:installation_date]
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

  def self.oldest_station
    order(:installation_date).last
  end

  def self.most_recently_installed_station
    order(:installation_date).first
  end

  def self.average_bikes_per_station
    average(:dock_count)
  end

end