require_relative '../models/subscription'
class Trip < ActiveRecord::Base
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

  def self.write(trip_details)
    self.find_or_create_by(subscription_id: find_subscription_id(trip_details[:subscription_name]),
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

  def self.find_station_id(station_name)
    return "This station has not been added to the database yet" if Station.find_by(name: station_name).nil?
    Station.find_by(name: station_name).id
  end

end