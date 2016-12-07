class Station < ActiveRecord::Base

  validates :name,
            :dock_count,
            :city_id,
            :installation_date,
            :lat,
            :long,
            presence: true

  validates :name, uniqueness: true

  belongs_to :city
  has_many :departure_trips, class_name: 'Trip', :foreign_key => :start_station_id
  has_many :arrival_trips, class_name: 'Trip', :foreign_key => :end_station_id

  def self.total_station_count
    Station.count
  end

  def self.average_bikes_per_station
    Station.average(:dock_count).to_i
  end

  def self.maximum_bikes_per_station
    Station.maximum(:dock_count)
  end

  def self.stations_with_maximum_bikes_available
    Station.where(dock_count:(Station.maximum(:dock_count))).pluck(:name)
  end

  def self.minimum_bikes_per_station
    Station.minimum(:dock_count)
  end

  def self.stations_with_minimum_bikes_available
    Station.where(dock_count:(Station.minimum(:dock_count))).pluck(:name)
  end

  def self.newest_station
    Station.order(:installation_date).last.name
  end

  def self.oldest_station
    Station.order(:installation_date).first.name
  end

end
