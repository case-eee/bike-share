class Station < ActiveRecord::Base
  validates :name, :dock_count, :city_id, :installation_date, presence: true
  has_many :trip_starts, :class_name => 'Trip', :foreign_key => 'start_station_id'
  has_many :trip_ends, :class_name => 'Trip', :foreign_key => 'end_station_id'
  belongs_to :city
  

  def self.total_stations
    count
  end

  def self.average_bikes_per_station
    average :dock_count
  end

  def self.max_bikes
    maximum :dock_count
  end

  def self.station_with_max_bikes
    where(dock_count: maximum(:dock_count))
  end

  def self.min_bikes
    minimum :dock_count
  end

  def self.station_with_min_bikes
    where(dock_count: minimum(:dock_count))
  end

  def self.newest
    where(installation_date: maximum(:installation_date))
  end

  def self.oldest
    where(installation_date: minimum(:installation_date))
  end

end
