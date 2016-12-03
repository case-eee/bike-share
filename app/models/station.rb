class Station < ActiveRecord::Base

  def self.total_stations
    Station.all.count
  end

  def self.average_bikes_per_station
    Station.average :dock_count
  end

  def self.max_bikes
    Station.maximum :dock_count
  end

  def self.station_with_max_bikes
    Station.where(dock_count: Station.maximum(:dock_count))
  end

  def self.min_bikes
    Station.minimum :dock_count
  end

  def self.station_with_min_bikes
    Station.where(dock_count: Station.minimum(:dock_count))
  end

  def self.newest
    #Station.group(:).having('installation_date = MAX(installation_date)')
    p Station.where(installation_date: Station.maximum(:installation_date))
  end

end


# Total count of stations
# Average bikes available per station (based on docks).
# Most bikes available at a station.
# Station(s) where the most bikes are available.
# Fewest bikes available at a station.
# Station(s) where the fewest bikes are available.
# Most recently installed station.
# Oldest station.
