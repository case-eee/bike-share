class Station < ActiveRecord::Base 

  has_many :start_trips , class_name: "Trip", foreign_key: "start_station_id" do 
    def bike_most_used_starting
      group(:bike_id).order("count_bike_id DESC").count(:bike_id).first.first
    end
  end
  has_many :end_trips , class_name: "Trip", foreign_key: "end_station_id"
  
  
  
  validates :name, :dock_count, :city_id, :installation_date, presence: true


  def self.write(station_details)
    self.find_or_create_by(name: station_details[:name],
                          lat: station_details[:lat],
                          long: station_details[:long],
                          dock_count: station_details[:dock_count],
                          city_id: find_city_id(station_details[:city_name]),
                          installation_date: station_details[:installation_date]
                          )
  end

  def self.find_city_id(city_name)
    City.write(name: city_name).id
  end

  def self.fewest_bikes
    minimum(:dock_count)
  end

  def self.find_by_fewest_bikes
    return [] if fewest_bikes.nil?
    where("dock_count = #{fewest_bikes}")
  end

  def self.oldest_station
    order(:installation_date).first
  end

  def self.most_recently_installed_station
    order(:installation_date).last
  end

  def self.average_bikes_per_station
    average(:dock_count)
  end

  def self.most_bikes
    maximum(:dock_count)
  end

  def self.find_by_most_bikes
    return [] if most_bikes.nil?
    where("dock_count = #{most_bikes}")
  end

  def most_frequent_user_zipcode_as_start_station
    start_trips.group(:zipcode).order("count_id DESC").limit(1).count(:id).keys.first
  end

  def most_frequent_origin_station
    end_trips.group(:start_station_id).order("count_id DESC").limit(1).count(:id).keys.first
  end

end
