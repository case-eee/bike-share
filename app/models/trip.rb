class Trip < ActiveRecord::Base
  validates :duration,
            :start_date,
            :start_station_name,
            :start_station_id,
            :end_date,
            :end_station_name,
            :end_station_id,
            :bike_id,
            :subscription_type,
            :zip_code, presence: true

  belongs_to  :starting_station, class_name: :Station, foreign_key: :start_station_id
  belongs_to  :end_station, class_name: :Station, foreign_key: :end_station_id

  def self.average_duration
    average(:duration)
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.most_popular_starting_station
    trip_uses = group(:start_station_id).count
    highest_use = group(:start_station_id).count.values.max
    station_id = trip_uses.key(highest_use)
    Station.find(station_id)
  end

  def self.least_popular_starting_station
    trip_uses = group(:start_station_id).count
    lowest_use = group(:start_station_id).count.values.min
    station_id = trip_uses.key(lowest_use)
    Station.find(station_id)
  end

  def self.month_by_month_breakdown
    c = Calendar.new
    c.year_2013 = where('extract(year FROM start_date) = ?', 2013)
    c.year_2014 = where('extract(year FROM start_date) = ?', 2014)
    c.year_2015 = where('extract(year FROM start_date) = ?', 2015)
    group("DATE_TRUNC('month',start_date)").count
    # binding.pry
  end

  def self.bike_uses
    Trip.group(:bike_id).count
  end

  def self.most_ridden_bike
    highest_bike = bike_uses.max
    Struct.new("Bike", :id, :count)
    Struct::Bike.new(highest_bike[0].to_i, highest_bike[1])
  end

  def self.least_ridden_bike
    lowest_bike = bike_uses.min
    Struct.new("Bike", :id, :count)
    Struct::Bike.new(lowest_bike[0].to_i, lowest_bike[1])
  end

  def self.subscribers
    subscriber = Trip.group(:subscription_type).count
    total_subscribers = subscriber.values.sum
    percentage = calculate_percentage(total_subscribers,subscriber["Subscriber"])
    Struct.new("Subscribers", :total, :count, :percent)
    Struct::Subscribers.new(total_subscribers, subscriber["Subscriber"],percentage)
  end

  def self.calculate_percentage(total,initial_value)
    (initial_value.to_f / total.to_f) * 100
  end

  def self.consumers
    consumers = Trip.group(:subscription_type).count
    total_subscribers = subscriber.values.sum
    #total - number = result
    #(result / total) * 100
    Struct.new("Subscribers", :total, :count, :percent)
    Struct::Users.new(highest_bike[0].to_i, highest_bike[1])

    Struct.new("Subscribers", :total, :count, :percent)
    Struct::Users.new(highest_bike[0].to_i, highest_bike[1])
  end

end
