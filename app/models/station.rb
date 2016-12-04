class Station < ActiveRecord::Base
  validates :name, :dock_count, :city_id, :installation_date, presence: true
  has_many :trip_starts, :class_name => 'Trip', :foreign_key => 'start_station_id'
  has_many :trip_ends, :class_name => 'Trip', :foreign_key => 'end_station_id'
  belongs_to :city
  

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
    Station.where(installation_date: Station.maximum(:installation_date))
  end

  def self.oldest
    Station.where(installation_date: Station.minimum(:installation_date))
  end

end
