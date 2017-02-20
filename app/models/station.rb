class Station < ActiveRecord::Base
  validates :name, :dock_count, :city_id, :installation_date, :lat, :long, presence: true
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

  def self.ride_starts(station_id)
    find(station_id).trip_starts.count
  end

  def self.ride_ends(station_id)
    find(station_id).trip_ends.count
  end

  def self.most_frequent_destination(station_id)
    find(station_id).trip_starts.group(:end_station_id).count.max_by{|k, v| v}.first
  end

  def self.most_frequent_origin(station_id)
    find(station_id).trip_ends.group(:start_station_id).count.max_by{|k, v| v}.first
  end

  def self.most_frequent_zip(station_id)
    find(station_id).trip_starts.group(:zip_code).count.max_by{|k, v| v}.first
  end

  def self.most_frequent_bike_id(station_id)
    find(station_id).trip_starts.group(:bike_id).count.max_by{|k, v| v}.first    
  end

  def self.most_trips(station_id)
    find(station_id).trip_starts.group(:start_date).count.max_by{|k, v| v}.first  
  end

  def self.station_locations
    coordinates_array = Station.pluck(:lat, :long)
    coordinates_hash = {}
    return_array = coordinates_array.map do |coordinates|
      {:lat => coordinates[0], :lng => coordinates[1] }
    end
    return_array
  end

end
