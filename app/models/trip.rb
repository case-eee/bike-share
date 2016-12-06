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
    create(duration:         trip_details[:duration],
           start_date:       trip_details[:start_date],
           start_station_id: trip_details[:start_station_id],
           end_date:         trip_details[:end_date],
           end_station_id:   trip_details[:end_station_id],
           bike_id:          trip_details[:bike_id],
           subscription_id:  find_subscription_id(trip_details[:subscription_type]),
           zipcode:          trip_details[:zipcode])
  end

  def self.find_subscription_id(subscription_name)
    Subscription.find_or_create_by(name: subscription_name).id
  end

  def self.write(trip_details)
  require 'pry'; binding.pry
    self.find_or_create_by(subscription_id: find_subscription_id(trip_details[:subscription_type]),
                          duration: trip_details[:duration],
                          start_date: trip_details[:start_date],
                          start_station_id: trip_details[:start_station_id],
                          end_station_id: trip_details[:end_station_id],
                          end_date: trip_details[:end_date],
                          bike_id: trip_details[:bike_id],
                          zipcode: trip_details[:zip_code])
  end

  def self.find_subscription_id(subscription_type)
  require 'pry'; binding.pry
    Subscription.write(type: subscription_type).id
  end

end