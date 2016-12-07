class Station < ActiveRecord::Base
  validates :name,
            :dock_count,
            :city,
            :installation_date, presence: true

  has_many :start_trips, class_name: :Trip, foreign_key: :start_station_id
  has_many :end_trips, class_name: :Trip, foreign_key: :end_station_id

  def self.total_stations
    count
  end

  def self.average_number_of_bikes
    average(:dock_count)
  end

  def self.most_bikes_available
    maximum(:dock_count)
  end

  def self.with_most_bikes
    find_by(dock_count: most_bikes_available)
  end

  def self.fewest_bikes_available
    minimum(:dock_count)
  end

  def self.with_fewest_bikes
    find_by(dock_count: fewest_bikes_available)
  end

  def self.newest_station
    find_by(installation_date: maximum(:installation_date))
  end

  def self.oldest_station
    find_by(installation_date: minimum(:installation_date))
  end

  def rides_started
    start_trips.count
  end

  def rides_ended
    end_trips.count
  end

  def most_common_destination
    start_trips.most_popular_ending_station
  end

  def most_common_origination
    end_trips.most_popular_starting_station
  end

  def date_with_most_trips_started
    start_trips.date_with_the_most_trips.date
  end

  def most_common_zip_code
    zip_hash = start_trips.group(:zip_code).order(:zip_code).limit(1).count
    zip_hash.max[0]
  end

  def most_common_bike_id
    start_trips.most_ridden_bike.id
  end
end
