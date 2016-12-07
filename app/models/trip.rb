require_relative '../models/subscription'
require_relative '../models/date_format'

class Trip < ActiveRecord::Base
  include DateFormat
  validates :duration,
            :start_date,
            :start_station_id,
            :end_date,
            :end_station_id,
            :bike_id,
            :subscription_id, 
            :zipcode,
               presence: true
  belongs_to :subscription
  belongs_to :start_station, class_name: "Station", foreign_key: "start_station_id"
  belongs_to :end_station, class_name: "Station", foreign_key: "end_station_id"

  def self.import(trip_details)
    self.create(subscription_id: find_subscription_id(trip_details[:subscription_type]),
                duration: trip_details[:duration],
                start_date: trip_details[:start_date],
                start_station_id: find_station_id(trip_details[:start_station_name]),
                end_station_id: find_station_id(trip_details[:end_station_name]),
                end_date: trip_details[:end_date],
                bike_id: trip_details[:bike_id],
                zipcode: trip_details[:zipcode])
  end
  
  def self.write(trip_details)
    self.find_or_create_by(subscription_id: find_subscription_id(trip_details[:subscription_type]),
                          duration: trip_details[:duration],
                          start_date: trip_details[:start_date],
                          start_station_id: find_station_id(trip_details[:start_station_name]),
                          end_station_id: find_station_id(trip_details[:end_station_name]),
                          end_date: trip_details[:end_date],
                          bike_id: trip_details[:bike_id],
                          zipcode: trip_details[:zipcode])
  end

  def self.find_subscription_id(subscription_type)
    Subscription.write(name: subscription_type).id
  end

  def self.longest_ride
    Trip.maximum(:duration)
  end

  def self.station_with_most_starting_rides
    Station.find(Trip.group(:start_station_id).order('count_id DESC').limit(1).count(:id).keys.first)
  end

  def self.least_ridden_bike 
    Trip.group(:bike_id).order('count_id ASC').limit(1).count(:id).keys.first
  end

  def self.trips_by_bike(given_bike_id)
    where(bike_id: given_bike_id).count
  end

  def self.day_with_lowest_number_of_trips
    Trip.group(:start_date).order("count_id ASC").limit(1).count(:id).keys.first
  end

  def self.most_frequent_destination_station
    Station.find(Trip.group(:end_station_id).order("count_id DESC").limit(1).count(:id).keys.first)
  end

  def self.find_station_id(station_name)
    return "This station has not been added to the database yet" if Station.find_by(name: station_name).nil?
    Station.find_by(name: station_name).id
  end

  def self.average_duration_of_a_ride
    average(:duration)
  end

  def self.trip_count_for_stations_as_starting_place_all
    Trip.group(:start_station_id).order("count_start_station_id desc").count("start_station_id")
  end

  def self.station_with_most_rides_as_starting_place
    start_station_id_count_list = trip_count_for_stations_as_starting_place_all
    start_station_id = start_station_id_count_list.first.first
    Station.find(start_station_id)
  end

  def self.most_ridden_bike_with_total_number_of_rides_for_that_bike_all
    Trip.group(:bike_id).order("count_bike_id desc").count("bike_id")
  end

  def self.most_ridden_bike_with_total_number_of_rides_for_that_bike
    bike_ridden_id_count_list = most_ridden_bike_with_total_number_of_rides_for_that_bike_all
    {
      :most_ridden_bike_id => bike_ridden_id_count_list.first.first,
      :total_number_of_rides => bike_ridden_id_count_list.first.last
    }
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.monthly_rides
    Trip.group("DATE_TRUNC('month', start_date)").order("count_start_station_id DESC").count(:start_station_id)
  end

  def self.monthly_breakdown_of_rides
    breakout = monthly_rides
    {
      :monthly_breakdown => 
      [(Date.parse breakout.keys.each {|date| date.to_s}.join), 
                   breakout.values.each {|trip| trip}.flatten]
    }  
  end

  def self.subscription_types
    subs = Trip.group(:subscription_id).order('count_subscription_id DESC').count(:subscription_id)
    if subs.count == 1
      total = subs[1]
    elsif subs.count == 2
      total = subs[1] + subs[2]
    end
    {
      (Subscription.find(subs.keys[0]).name) => [subs[1], subs[1]/total.to_f * 100],
      (Subscription.find(subs.keys[1]).name) => [subs[2], subs[2]/total.to_f * 100]
    }
  end
end